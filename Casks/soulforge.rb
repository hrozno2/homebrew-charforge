cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.14.0"
  sha256 arm:   "32f3084052cf2cdeacfb5e12ef26b41bf0ae0fca4765c6e69bec9a05bfa4e618",
         intel: "f937be600f4078c6eb37b24fe1b42c047381c1294d7d9c465bb869c90e91e097"

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
