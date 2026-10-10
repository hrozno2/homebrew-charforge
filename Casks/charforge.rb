cask "charforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "66a1629f1115329740f58ccd1c7a78da301591108a1942747db5b5c82e05be83",
         intel: "6f379bd7ae760e57175ff272c43b20abcff56977dade2701fc62e4f5cdc5b304"

  url "https://github.com/hrozno2/charforge/releases/download/v#{version}/CharForge_#{version}_#{arch}.dmg"
  name "CharForge"
  desc "D&D 5e (2024) character builder with custom modifiers and PDF export"
  homepage "https://github.com/hrozno2/charforge"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself, so Homebrew should not reinstall it on every `brew upgrade`.
  auto_updates true

  app "CharForge.app"

  # The app is not notarized, so clear the quarantine flag to avoid the "damaged" warning.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CharForge.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.charforge.desktop",
    "~/Library/Caches/app.charforge.desktop",
    "~/Library/WebKit/app.charforge.desktop",
  ]
end
