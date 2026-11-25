cask "sprigo" do
  arch arm: "aarch64", intel: "x64"

  version "1.14.0"
  sha256 arm:   "4ef686f49d7c72e1730d6ad09e2d6c885a2e01bb21e73a00ab760bc5944af6a5",
         intel: "d9d681e8b2048916cc3ab2f8938f6d21f064a569ed12da9c859ee6a9ab62d97e"

  url "https://github.com/ozerozdas/sprigo/releases/download/v#{version}/Sprigo_#{version}_#{arch}.dmg"
  name "Sprigo"
  desc "Local-first language learning app with an AI tutor"
  homepage "https://github.com/ozerozdas/sprigo"

  # The app updates itself (Tauri updater).
  auto_updates true
  depends_on :macos

  app "Sprigo.app"

  # The app is not notarized yet: drop the quarantine flag so Gatekeeper lets it open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Sprigo.app"]
  end

  zap trash: [
    "~/Library/Application Support/com.ozerozdas.sprigo",
    "~/Library/Caches/com.ozerozdas.sprigo",
    "~/Library/WebKit/com.ozerozdas.sprigo",
  ]
end
