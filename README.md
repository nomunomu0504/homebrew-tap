# Homebrew tap for sub-screen-player

[日本語](README.ja.md)

[sub-screen-player](https://github.com/nomunomu0504/sub-screen-player) (`ssp`) shows clocks,
dashboards, web pages and videos on USB bar displays. Install it on macOS or Linux with
[Homebrew](https://brew.sh):

```sh
brew install nomunomu0504/tap/ssp
ssp service install      # start the daemon now and whenever you log in
```

Update with `brew upgrade ssp`, then restart the daemon: `ssp service install` again on macOS,
`systemctl --user restart sub-screen-player` on Linux.

The formula installs the binaries attached to each
[release](https://github.com/nomunomu0504/sub-screen-player/releases), checked against the
release's `SHA256SUMS.txt`. [`update.sh`](update.sh) writes it, and a workflow runs it every
hour and commits the result once it installs on macOS and Linux. Report problems in the
[sub-screen-player issues](https://github.com/nomunomu0504/sub-screen-player/issues).
