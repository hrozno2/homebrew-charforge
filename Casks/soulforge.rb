cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "9ddb892a12db1d5331f591a72229049b6c7d639bedaf7610e96767bec65429b1",
         intel: "4c88cb304b7e811cccc968cbed56a1aa1b104cebe01373a541d152ff092ec737"

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
