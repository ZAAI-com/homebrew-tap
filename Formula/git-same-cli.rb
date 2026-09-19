# Homebrew Formula template for git-same-cli.
# Rendered by S3-Publish-Homebrew.yml into Formula/git-same-cli.rb on the tap.
#
# This formula is the cross-platform path: Linux (x86_64, aarch64) and headless
# macOS (x86_64, aarch64). On macOS it installs the same signed + notarized
# tarball that the cask uses. macOS GUI users should prefer the cask.
#
# Brew infers `version` from the URL filename (each URL embeds the full target
# triple and version), so no explicit `version` declaration is needed.
class GitSameCli < Formula
  desc "Discover and mirror GitHub org/repo structures locally"
  homepage "https://github.com/zaai-com/git-same"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/3.1.1/git-same-3.1.1-aarch64-apple-darwin.tar.gz"
      sha256 "5c0cd2ecce0a7d3f762cee49013b55a6d91377c2ae5d377e26d5411f563a13d0"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.1.1/git-same-3.1.1-x86_64-apple-darwin.tar.gz"
      sha256 "53d246ae333daac9ec9edc63dc3305f2936c4608fe7ef17017042c176f01078d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/3.1.1/git-same-3.1.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b9646cd1926031fd753e649c45c8bb8b6f4d13635b6501f4ef57651fef5e8280"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.1.1/git-same-3.1.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6f84682f072513df4238fa1a37d0ca826a1390968a106f6a3bbdf0bc943cca30"
    end
  end

  def install
    bin.install "git-same"
    bin.install_symlink "git-same" => "gitsame"
    bin.install_symlink "git-same" => "gitsa"
    bin.install_symlink "git-same" => "gisa"

    man1.install "git-same.1"
    bash_completion.install "git-same.bash" => "git-same"
    zsh_completion.install  "_git-same"
    fish_completion.install "git-same.fish"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-same --version")
    assert_match version.to_s, shell_output("#{bin}/gitsame --version")
    assert_match version.to_s, shell_output("#{bin}/gitsa --version")
    assert_match version.to_s, shell_output("#{bin}/gisa --version")
  end
end
