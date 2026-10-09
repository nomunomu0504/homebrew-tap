# sub-screen-player の Homebrew tap

[English](README.md)

[sub-screen-player](https://github.com/nomunomu0504/sub-screen-player)（`ssp`）は、USB のサブディスプレイに
時計・ダッシュボード・Web ページ・動画を表示するツールです。macOS と Linux では [Homebrew](https://brew.sh) で
インストールできます。

```sh
brew install nomunomu0504/tap/ssp
ssp service install      # デーモンを今すぐ起動し、ログインのたびに起動する
```

`brew upgrade ssp` で更新したら、デーモンを再起動してください（macOS はもう一度 `ssp service install`、Linux は
`systemctl --user restart sub-screen-player`）。

Formula は、各[リリース](https://github.com/nomunomu0504/sub-screen-player/releases)に添付されたバイナリを、
リリースの `SHA256SUMS.txt` で確かめてインストールします。Formula は [`update.sh`](update.sh) が書き出し、
ワークフローが 1 時間ごとに実行して、macOS と Linux でインストールできたものだけをコミットします。問題は
[sub-screen-player の Issue](https://github.com/nomunomu0504/sub-screen-player/issues) に報告してください。
