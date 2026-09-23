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
      url "https://github.com/zaai-com/git-same/releases/download/3.2.0/git-same-3.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "6a7df032411de3c6256a05dc14ebdb9984254b3cf43a6cbf0a69b9dd051fa361"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.2.0/git-same-3.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "bc47db055307453c6c1165194c014d2dd8207545fd3abe534ad8447ae68b759e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/3.2.0/git-same-3.2.0-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4b131aca8b7139568a75ab3c7383c23a9f60dc40e845f3edd8c845b07f95c802"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.2.0/git-same-3.2.0-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0bdd99c52b2bb5fc484ebce98b539e929a4fab33af7590f724d3f6771d9fca1c"
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
