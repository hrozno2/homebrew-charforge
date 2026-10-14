cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.11.0"
  sha256 arm:   "987915392f54b74f41f4cc4c1219f7d9e3019eef06c2f3296607aa7676329804",
         intel: "ad0e1e9b3b5b21055cb986f969bc53fb0b1c5df89b6ff321461dd1819bb32bc9"

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
