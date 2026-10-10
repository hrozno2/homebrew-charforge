cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.5"
  sha256 arm:   "cbcecb2f22390cc603baf3bbef2eba4431df56a9e5c3f1c308e48b05e0d2770f",
         intel: "231cacb6e7a65b5a81f58157db127ef843cac9ffe8322d11961d9c81b76b8e9c"

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
