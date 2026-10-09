# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.7.0/ssp-v0.7.0-universal-apple-darwin.tar.gz"
      sha256 "b8373a132c407e5eab7037af4e7e1eed8f495dfb1b04ae0e2da2263bf2b0ba10"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.7.0/ssp-v0.7.0-universal-apple-darwin.tar.gz"
      sha256 "b8373a132c407e5eab7037af4e7e1eed8f495dfb1b04ae0e2da2263bf2b0ba10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.7.0/ssp-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7d0be69a91022570d42b92a68ae2e23c8fe2d1461786b117c85064c485a0e036"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.7.0/ssp-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d122529c921e20240348960984cc3ffaf110dc9a8c77e01644715bbe9f8ab42f"
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
