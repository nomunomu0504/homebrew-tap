# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "0.6.0"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.6.0/ssp-v0.6.0-universal-apple-darwin.tar.gz"
      sha256 "fa51d5f42a9038fbe6d17d49b120e41ef8847e209e4ab19123221250ba43ea9b"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.6.0/ssp-v0.6.0-universal-apple-darwin.tar.gz"
      sha256 "fa51d5f42a9038fbe6d17d49b120e41ef8847e209e4ab19123221250ba43ea9b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.6.0/ssp-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d4a58249b543d7c5ba1cbbae1953a956b89e64b9c974acfd8f423e2fc46f482c"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.6.0/ssp-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a79873da7add46c1cca0736c7bbb5769029ee59738a5236ed475e9229f1a2338"
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
