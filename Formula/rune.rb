# A formula rather than a cask, because this is a command line program: it has no
# application bundle to copy, and Homebrew installs a formula's binary onto the
# path where a shell finds it.
#
# `rune` is already the name of an embeddable language in homebrew/core, and core
# wins a bare name, so this is installed as `aadixc0de/tap/rune`. A bare
# `brew install rune` would get the language, which is why the readme gives the
# qualified name.
class Rune < Formula
  desc "Native coding agent harness"
  homepage "https://github.com/AadiXC0DE/Rune"
  version "0.1.8"
  license "Apache-2.0"

  # The download URL sits inside a platform branch, which livecheck cannot read,
  # so it follows the stable URL's releases instead.
  livecheck do
    url :stable
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/AadiXC0DE/Rune/releases/download/v#{version}/rune-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "169352fa60f8270fc97ac1b1a77c75b57ff6cce0f806b2c45724ca0e164f5c1d"
    else
      url "https://github.com/AadiXC0DE/Rune/releases/download/v#{version}/rune-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ea03f0129a60da5a780f9d622a09d0f0f7ed58a603b7d85479c4aa51d4f21141"
    end
  end

  def install
    bin.install "rune"
  end

  def caveats
    <<~EOS
      Rune has no default provider. Connect one before the first turn:

        rune connect

      That lists the providers and asks for what the one you choose needs.

      Then check what this machine supports:

        rune doctor
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rune --version")
  end
end
