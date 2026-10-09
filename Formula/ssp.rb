# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.5.0/ssp-v0.5.0-universal-apple-darwin.tar.gz"
      sha256 "93ffe91fcba3b533fd1b3a6a2037572a617f678cf29283e332177a9c4ceaeb10"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.5.0/ssp-v0.5.0-universal-apple-darwin.tar.gz"
      sha256 "93ffe91fcba3b533fd1b3a6a2037572a617f678cf29283e332177a9c4ceaeb10"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.5.0/ssp-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d529121b2eee1e58cb2ae7299c9ed829ad9ea537fda9a3be35f6de12e2addc52"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.5.0/ssp-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c1a3500d35df7df40f98e6b409522ae9ce7fee810c51f3c283c23f15c2275fc7"
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
