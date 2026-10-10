# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "0.8.1"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.8.1/ssp-v0.8.1-universal-apple-darwin.tar.gz"
      sha256 "84b40ac7c149fb029b9a2b9c6ec995d8d791966fad1a8fedeb8e55fe10a0333f"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.8.1/ssp-v0.8.1-universal-apple-darwin.tar.gz"
      sha256 "84b40ac7c149fb029b9a2b9c6ec995d8d791966fad1a8fedeb8e55fe10a0333f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.8.1/ssp-v0.8.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "075b4ca0624961c6ec67102b2a1253ef2620c9b21225c5de0839c66659425ad8"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.8.1/ssp-v0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7d0a56f0a28fc1c6a25d9f26fcdd256836a08bf7e1ce803fa64a612dcb2c3699"
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
