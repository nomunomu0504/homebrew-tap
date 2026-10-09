#!/bin/sh
# Writes Formula/ssp.rb for a release of sub-screen-player: the latest one, or the tag in $1.
# The checksums come from the release's SHA256SUMS.txt.
#
#   sh update.sh           # the latest release
#   sh update.sh v0.5.1    # a given one
set -eu
cd "$(dirname "$0")"
repo=nomunomu0504/sub-screen-player

tag=${1:-}
if [ -z "$tag" ]; then
	# The latest release page redirects to .../releases/tag/<version>.
	tag=$(curl -fsSLI -o /dev/null -w '%{url_effective}' "https://github.com/$repo/releases/latest")
	tag=${tag##*/}
fi
case "$tag" in
v[0-9]*) ;;
*) echo "cannot tell the latest version (got '$tag')" >&2; exit 1 ;;
esac

url="https://github.com/$repo/releases/download/$tag"
sums=$(curl -fsSL "$url/SHA256SUMS.txt")
sum() {
	s=$(printf '%s\n' "$sums" | awk -v f="ssp-$tag-$1.tar.gz" '$2 == f || $2 == "*" f { print $1 }')
	[ ${#s} -eq 64 ] || { echo "no checksum for ssp-$tag-$1.tar.gz" >&2; exit 1; }
	echo "$s"
}
mac=$(sum universal-apple-darwin)
linux_arm=$(sum aarch64-unknown-linux-musl)
linux_intel=$(sum x86_64-unknown-linux-musl)

cat > Formula/ssp.rb <<EOF
# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "${tag#v}"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "$url/ssp-$tag-universal-apple-darwin.tar.gz"
      sha256 "$mac"
    end
    on_intel do
      url "$url/ssp-$tag-universal-apple-darwin.tar.gz"
      sha256 "$mac"
    end
  end

  on_linux do
    on_arm do
      url "$url/ssp-$tag-aarch64-unknown-linux-musl.tar.gz"
      sha256 "$linux_arm"
    end
    on_intel do
      url "$url/ssp-$tag-x86_64-unknown-linux-musl.tar.gz"
      sha256 "$linux_intel"
    end
  end

  def install
    bin.install "ssp"
  end

  def caveats
    restart = OS.mac? ? "ssp service install" : "systemctl --user restart sub-screen-player"
    <<~EOS
      To start the daemon now and whenever you log in:
        ssp service install
      After upgrading ssp, restart the daemon:
        #{restart}
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/ssp --version")
  end
end
EOF
echo "Formula/ssp.rb: $tag"
