cask "sprigo" do
  arch arm: "aarch64", intel: "x64"

  version "1.11.0"
  sha256 arm:   "8441e0d49c8e34296922100ff7ba51873e59d3e1e362a11ec7b03215de4d14ce",
         intel: "afd742530ff5f8057f51bddc693fd27a7b042a808ed4f3cf396be8fd7f154732"

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
