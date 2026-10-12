cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.10.0"
  sha256 arm:   "d574a98d0f493c8772e57a7bb270774cee9ffc2e13cbe75c9ee08ed079878375",
         intel: "27edc4443f883b8bc3e4132c4d3a2f07f6bc9386d61a56194f731f3551c2ccf4"

  url "https://github.com/hrozno2/SoulForge/releases/download/v#{version}/SoulForge_#{version}_#{arch}.dmg"
  name "Soul Forge"
  desc "D&D 5e (2024) character builder with custom modifiers and PDF export"
  homepage "https://github.com/hrozno2/SoulForge"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself, so Homebrew should not reinstall it on every `brew upgrade`.
  auto_updates true

  app "SoulForge.app"

  # The app is not notarized, so clear the quarantine flag to avoid the "damaged" warning.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/SoulForge.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.charforge.desktop",
    "~/Library/Caches/app.charforge.desktop",
    "~/Library/WebKit/app.charforge.desktop",
  ]
end
