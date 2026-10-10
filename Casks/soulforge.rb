cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.8.0"
  sha256 arm:   "4ccea3177a2bdc044c283200d566462df02169149cb1dd90aeefc3b27eba660a",
         intel: "4e9f7d12889a7dc819af94b77db0bec6248ceed03a012097ce7ca10d3ce61db1"

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
