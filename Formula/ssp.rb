# Written by update.sh from the release's SHA256SUMS.txt; do not edit by hand.
class Ssp < Formula
  desc "Shows clocks, dashboards, web pages and videos on USB bar displays"
  homepage "https://subscreen.dev"
  version "0.7.1"
  license any_of: ["MIT", "Apache-2.0"]

  # One universal binary for both kinds of Mac.
  on_macos do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.7.1/ssp-v0.7.1-universal-apple-darwin.tar.gz"
      sha256 "95be90eaad0203a9091712aef3bf9df71b101fd9e77e8221733f66d2eeb26076"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.7.1/ssp-v0.7.1-universal-apple-darwin.tar.gz"
      sha256 "95be90eaad0203a9091712aef3bf9df71b101fd9e77e8221733f66d2eeb26076"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.7.1/ssp-v0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "5811635752eda2d27751a0342af74d7a37cf197c6b41eb7e957154275ac94614"
    end
    on_intel do
      url "https://github.com/nomunomu0504/sub-screen-player/releases/download/v0.7.1/ssp-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c496dd8a819894bf8b285edc049d80382ab569b69bc5fbba08985b3f8e8495c4"
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
