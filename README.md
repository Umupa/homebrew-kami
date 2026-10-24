# Homebrew Tap for Kami

[Kami](https://github.com/Umupa/Kami) 的 Homebrew tap：常驻 Mac 菜单栏的桌面 AI 工具箱。

```sh
brew install --cask umupa/kami/kami
```

需要 macOS 15.2 或更新版本。Kami 用自签名证书签名，第一次打开时在「系统设置 → 隐私与安全性」里点「仍要打开」。之后 Kami 自己检查并安装更新。

`Casks/kami.rb` 由 Kami 的发布流程在每次发布后自动更新，不要手改。
