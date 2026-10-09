# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "0.5.1"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.5.1/ssp-v0.5.1-universal-apple-darwin.tar.gz"
      sha256 "c86efeb1022a647314ef0dada801f20ae9e0c5fe047e5aced4c9f13f7ad931b6"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.5.1/ssp-v0.5.1-universal-apple-darwin.tar.gz"
      sha256 "c86efeb1022a647314ef0dada801f20ae9e0c5fe047e5aced4c9f13f7ad931b6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.5.1/ssp-v0.5.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "a845fcf150c4d7c25017467a5875791b90301d19cad1759258f765ef909b0bf8"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.5.1/ssp-v0.5.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "020ca62dc622bc819e46179463e1622104efcae8a4aeb75899c59036aeb6b107"
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
