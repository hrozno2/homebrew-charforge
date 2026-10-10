cask "charforge" do
  arch arm: "aarch64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "a144b4d5f9ed685209dda843d7e9c9a12c7d0651566588a2d9c4c34bd9e23ff3",
         intel: "7040c35fa5fd3dacc18fcebcdcf01e01c3d2959f2a9431fa73685527a0813df1"

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
