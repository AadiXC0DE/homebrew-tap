cask "graphe" do
  # The zip, not the dmg. Homebrew can install from either, but a dmg has to be
  # mounted and unmounted for every install and upgrade, and the zip is the
  # smaller download of the two.
  arch arm: "arm64", intel: "x64"

  version "1.1.0"
  sha256 arm:   "42ae78156aa98225a4b35eab702b586c5b9e4e0c248a71385ce1dd5eb6ac0dae",
         intel: "96f0e8028e1c4edbac6806a85c6859c2115a564df7aa16fbfad2ba7424bee821"

  url "https://github.com/AadiXC0DE/graphe/releases/download/v#{version}/Graphe-#{version}-#{arch}.zip",
      verified: "github.com/AadiXC0DE/graphe/"
  name "Graphe"
  desc "Agentic coding platform for the desktop"
  homepage "https://github.com/AadiXC0DE/graphe"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Graphe's window is the entire product, so an old copy is a different
  # product. Say so rather than letting people sit on the build they installed.
  auto_updates false
  depends_on macos: :ventura

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
    Graphe is ad-hoc signed, not notarized by Apple. On first launch macOS
    may require approval through "Open Anyway" in System Settings,
    Privacy & Security. This cask does not bypass Gatekeeper.
  EOS
end
