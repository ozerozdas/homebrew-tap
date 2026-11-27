cask "sprigo" do
  arch arm: "aarch64", intel: "x64"

  version "1.16.0"
  sha256 arm:   "3a08df12154a922cd826d0af3fa7382352baf8cc12f94ccf81230c7b98185e77",
         intel: "58ec80a1877574625770cb716f6285786d8d833beb2944be0d1bb58b8337e356"

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
