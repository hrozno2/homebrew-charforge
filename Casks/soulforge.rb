cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "68928482139b729b0d723e4c14400794511cb5caf597cc876d5c1a2e61a77407",
         intel: "62e376262d514ea30e61861994b041fcd5b47d194b5f2c74824dee31933b3712"

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
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/SoulForge.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.charforge.desktop",
    "~/Library/Caches/app.charforge.desktop",
    "~/Library/WebKit/app.charforge.desktop",
  ]
end
