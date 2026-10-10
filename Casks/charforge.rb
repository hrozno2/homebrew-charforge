cask "charforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "c26e17c47111de665d9d80055f80ce2af8ce6d044be742e8873bcae47da1e31b",
         intel: "ae436fd83a18befcb80a1cc9ff4d4c0b98f7e1adf363c6b99a9cad762b3e54be"

  url "https://github.com/hrozno2/charforge/releases/download/v#{version}/CharForge_#{version}_#{arch}.dmg"
  name "CharForge"
  desc "D&D 5e (2024) character builder with custom modifiers and PDF export"
  homepage "https://github.com/hrozno2/charforge"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app updates itself, so Homebrew should not reinstall it on every `brew upgrade`.
  auto_updates true

  app "CharForge.app"

  # The app is not notarized, so clear the quarantine flag to avoid the "damaged" warning.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/CharForge.app"]
  end

  zap trash: [
    "~/Library/Application Support/app.charforge.desktop",
    "~/Library/Caches/app.charforge.desktop",
    "~/Library/WebKit/app.charforge.desktop",
  ]
end
