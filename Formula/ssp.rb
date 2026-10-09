# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.8.0/ssp-v0.8.0-universal-apple-darwin.tar.gz"
      sha256 "dff097d12a61156b5715edf48fd2e1427a0a503963323876b58a31d3d82f589c"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.8.0/ssp-v0.8.0-universal-apple-darwin.tar.gz"
      sha256 "dff097d12a61156b5715edf48fd2e1427a0a503963323876b58a31d3d82f589c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.8.0/ssp-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "33b730390fefba30e6b1bcc55864fb2a8c3a953bdb9dd6a39976617194c00763"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.8.0/ssp-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "3d2acaea2f45fb46e70153cfb24408344d01ee802e378452cb042d0145ac6323"
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
