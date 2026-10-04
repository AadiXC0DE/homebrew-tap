# AadiXC0DE Homebrew tap

Desktop apps published by AadiXC0DE.

## Install

[Sift](https://usesift.xyz), a keyboard-first Gmail client for macOS:

```sh
brew install --cask aadixc0de/tap/sift
```

[Graphe](https://github.com/AadiXC0DE/graphe), an agentic coding platform for the Mac:

```sh
brew install --cask aadixc0de/tap/graphe
```

## First launch

Homebrew checks the download against its checksum and installs the app. It does not notarize anything for you, so macOS may still show a Gatekeeper warning. Sift has a [first-launch guide](https://usesift.xyz/download#first-launch) that covers the fallback for when the Open Anyway button is not there.

## Keeping releases current

Each cask tracks the `Casks` directory in its own app repository. Pin the published version and the exact SHA-256 of the artifact. Skipping the checksum is how you end up shipping a different binary than the one you built.

## License

MIT. See [LICENSE](LICENSE).
