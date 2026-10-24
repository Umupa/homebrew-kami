cask "kami" do
  arch arm: "arm64", intel: "amd64"

  version "0.1.1"
  sha256 arm:   "316a5de9e6eb1a1cd7605a259dcbc1bea7d577b2b434cbbd3c89bacabeb8afda",
         intel: "618be738cf8676d0022418d7c3444ba7a937955a4182701fca74417496ef3143"

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
