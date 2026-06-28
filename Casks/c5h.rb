# Homebrew Cask template for C5h.
# Rendered by Toolkit/Homebrew/render-cask.sh into Casks/c5h.rb on the tap.
#
# C5h ships as a single universal (signed + notarized + stapled) .app inside a
# DMG, so there is one artifact and one SHA256 (no arch split). The zap stanza
# removes the app's data directory (see the c5h_data_locations note).
cask "c5h" do
  version "1.1.0"
  sha256 "acdd6607e5cabe97af7c16b07aa305370d79fbf082b14402fbe4799d8d2501cc"

  url "https://github.com/ZAAI-com/C5h/releases/download/#{version}/C5h-#{version}.dmg"
  name "C5h"
  desc "Schedule and run AI provider CLIs in planned and background windows"
  homepage "https://github.com/ZAAI-com/C5h"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :tahoe

  app "C5h.app"

  zap trash: "~/Library/Application Support/C5h"
end
