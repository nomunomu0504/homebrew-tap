# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "0.6.1"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.6.1/ssp-v0.6.1-universal-apple-darwin.tar.gz"
      sha256 "b525e081f69d0f8dcd2c70a372f315a15ab358abb5b0c89b528514bf63b2645c"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.6.1/ssp-v0.6.1-universal-apple-darwin.tar.gz"
      sha256 "b525e081f69d0f8dcd2c70a372f315a15ab358abb5b0c89b528514bf63b2645c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.6.1/ssp-v0.6.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "66e3ea10ce0123126947ed98358252884f49db62f4cbeaae7c80cc29c3fa1e55"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.6.1/ssp-v0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "08be2a177fc491b43316f58b315e8281170a82baacb719932109749ec26efaa4"
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
