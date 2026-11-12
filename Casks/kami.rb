cask "kami" do
  arch arm: "arm64", intel: "amd64"

  version "0.3.0"
  sha256 arm:   "aedacc3e00444b7bcacb366103b5d0624d117b4519e6c4bd32b0654f5aff03e7",
         intel: "c82b6b94417e6216261955c404b6948abf0ac2faf1b171f28bf5599a1086e059"

  url "https://github.com/Umupa/Kami/releases/download/v#{version}/Kami.#{version}.#{arch}.dmg"
  name "Kami"
  desc "常驻菜单栏的桌面 AI 工具箱"
  homepage "https://github.com/Umupa/Kami"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sequoia

  app "Kami.app"

  uninstall quit: "dev.umupa.kami"

  zap trash: [
        "~/Library/Application Support/Kami/config.json",
        "~/Library/Application Support/Kami/config.schema.json",
        "~/Library/Logs/Kami",
        "~/Library/Preferences/dev.umupa.kami.plist",
      ],
      rmdir: "~/Library/Application Support/Kami"

  caveats <<~EOS
    Kami 用自签名证书签名。第一次打开时 macOS 会提示无法验证开发者：
    在「系统设置 → 隐私与安全性」里点「仍要打开」。
  EOS
end
