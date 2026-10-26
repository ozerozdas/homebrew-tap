cask "sprigo" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.1"
  sha256 arm:   "4744a80f51a4a46a818756b702c5b82798e5338cfe99dc6585ab14825eaa5c4d",
         intel: "77685ad800f8b1bb02f304b979e762bc84c38b82d2adb4f1b14c709459ef4f55"

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
