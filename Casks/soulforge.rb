cask "soulforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.9.0"
  sha256 arm:   "0cd6641158f89b9fb439387636e09e8e3645abe759ae2943d0e88bcd0ddf4133",
         intel: "33e7d091c7720333cb8997271bcee0b111a80943826f31dd68c57f0ab6da13a9"

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
