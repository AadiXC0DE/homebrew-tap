# Maintained copy. Source of truth is the template in the app's repository:
# AadiXC0DE/graphe/Casks/graphe.rb. Update the template and copy it here at each
# release, filling in the current version and sha256 values.

cask "graphe" do
  # The zip, not the dmg. Homebrew can install from either, but a dmg has to be
  # mounted and unmounted for every install and upgrade, and the zip is the
  # smaller download of the two.
  arch arm: "arm64", intel: "x64"

  version "0.8.5"
  sha256 arm:   "da2c6e902ad759223e02a6ae9fa9603ee4a22dddad3a8cd7c5ad827a173528c0",
         intel: "bb95505cac73019e6497f014476f93262cfe1b7d91664dbabf68360bb747dba3"

  url "https://github.com/AadiXC0DE/graphe/releases/download/v#{version}/Graphe-#{version}-#{arch}.zip",
      verified: "github.com/AadiXC0DE/graphe/"
  name "Graphe"
  desc "Agentic coding platform for the desktop"
  homepage "https://github.com/AadiXC0DE/graphe"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Graphe is pre-1.0 and its window is the entire product, so an old copy is a
  # different product. Say so rather than letting people sit on the first build.
  auto_updates false
  depends_on macos: :monterey

  app "Graphe.app"

  # What Graphe leaves behind on this machine, so `brew uninstall --zap` really
  # does remove it. Deliberately *not* listed: `~/.pi`, which holds the account
  # the user connected and belongs to Pi rather than to us, and no project
  # folder anywhere — those are the user's own work and nothing we install may
  # ever remove them.
  zap trash: [
    "~/Library/Application Support/Graphe",
    "~/Library/Caches/xyz.graphe",
    "~/Library/Preferences/xyz.graphe.plist",
    "~/Library/Saved Application State/xyz.graphe.savedState",
  ]

  caveats <<~EOS
    Graphe is signed, but not notarized by Apple — there is no paid developer
    account yet. Homebrew 5 and earlier installed it with no prompt, but
    Homebrew 6 applies the quarantine attribute to cask installs, so on first
    launch macOS may ask you to allow it. If it does: right-click the app in
    Finder and choose Open, or use "Open Anyway" in System Settings → Privacy
    & Security. It is the genuine binary from the GitHub release, not a broken
    download — the prompt exists because Apple has not vetted a signed binary
    from a free account. Notarization removes it for good.
  EOS
end
