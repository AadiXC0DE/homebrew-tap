# AadiXC0DE Homebrew tap

Desktop apps published by AadiXC0DE.

## Install

[Sift](https://usesift.xyz) — a keyboard-first Gmail client for macOS:

```sh
brew install --cask aadixc0de/tap/sift
```

[Graphe](https://github.com/AadiXC0DE/graphe) — an agentic coding platform:

```sh
brew install --cask aadixc0de/tap/graphe
```

## First launch

Homebrew verifies the download checksum and installs the app. It does not
notarize an app or guarantee that macOS will skip Gatekeeper. Current Homebrew
applies quarantine to cask installs, so unnotarized apps may show a warning.
For Sift, follow the [first-launch guide](https://usesift.xyz/download#first-launch),
including the fallback when Open Anyway is missing.

## Maintaining releases

Keep each cask in sync with its app repository's `Casks` directory. Pin the
published version and exact verified artifact SHA-256; do not skip checksums.

## Licence

MIT — see [LICENSE](LICENSE).
