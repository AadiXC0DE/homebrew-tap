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
  version "0.1.11"
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
      sha256 "b20959f63fbd5bca981c51261eb49784d2caadbf6f7524d6b9be0fa05fba5cde"
    else
      url "https://github.com/AadiXC0DE/Rune/releases/download/v#{version}/rune-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "e2dc32f9fe1f045c73aae9cda7582d85c8578258fe918b67e844a82576830658"
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
