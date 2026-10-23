cask "sprigo" do
  arch arm: "aarch64", intel: "x64"

  version "1.10.0"
  sha256 arm:   "36e8afd1af4d414f13d2d17e31cf508b005ffe18056b2751a29ad15e9aee26e2",
         intel: "3c7db226c1eb4e0b0e33a26e84f411981f64cf3c3222c67a5e390c9e13278014"

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
