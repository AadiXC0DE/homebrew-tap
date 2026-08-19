# AadiXC0DE Homebrew tap

A small [Homebrew](https://brew.sh) tap for the apps published under
[AadiXC0DE](https://github.com/AadiXC0DE). It currently hosts one cask:

- **[Graphe](https://github.com/AadiXC0DE/graphe)** — an agentic coding
  platform for the desktop, built on
  [pi](https://github.com/earendil-works/pi).

## Install

```sh
brew tap AadiXC0DE/tap
brew install --cask graphe
```

## What this is for

Homebrew installs a cask without setting the macOS `com.apple.quarantine`
attribute that browsers and mail set on downloaded files — which is what makes
Graphe open with no Gatekeeper warning, despite being ad-hoc signed and not
notarized.

## Keeping the cask in step with the app

Each `Casks/*.rb` is copied from the release template kept in its app's own
repository. For Graphe that is `AadiXC0DE/graphe/Casks/graphe.rb`, copied here
at every release with the current `version` and both `sha256` values filled in.
Prefer editing the template over this copy, so the two never drift apart.

## Licence

MIT — see [LICENSE](LICENSE).
