cask "kami" do
  version "0.1.0"
  sha256 "94b3cb1dcfe186ea4e77f62dc3416ae83da440aa9e8eb8f6e4f852d300b1448e"

  url "https://github.com/Umupa/Kami/releases/download/v#{version}/Kami.#{version}.arm64.dmg"
  name "Kami"
  desc "常驻菜单栏的桌面 AI 工具箱"
  homepage "https://github.com/Umupa/Kami"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

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
