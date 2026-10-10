cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "3681aa3fa211acff0f7339e9787cccca35f2a2ede8403d89111469a41e437ba6",
         intel: "87a6591d9491dc9f161552b92bb5645ff2f4479b50cdc37e59047a02f9581cfb"

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
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/SoulForge.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.charforge.desktop",
    "~/Library/Caches/app.charforge.desktop",
    "~/Library/WebKit/app.charforge.desktop",
  ]
end
