cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.4"
  sha256 arm:   "0e93fb82ece57273ee9cf7f96257d089ed661bfa985bcbb6ac83d8bc3e815552",
         intel: "25604e733ed1c3ed8ffbea79a569b9f45764e54576b528d3be65a2a418c3fde5"

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
