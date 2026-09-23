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
      url "https://github.com/zaai-com/git-same/releases/download/3.2.1/git-same-3.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "f4047b122a7a2bd4b238864fdd0af44a4eced8efa1cd118d1a0f59c812ddca83"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.2.1/git-same-3.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "a5d796077eea28789ff332c368111ca329ba1523089401fae7600e7e9349f26d"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/3.2.1/git-same-3.2.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b67ea6cdaa85eff1e1557955c47a00d87fccaee248a06cf18950db727bbf3d94"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.2.1/git-same-3.2.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2daaf287d1f2c41d8a71fd8f1d85ed844ff44fdcb077eee8adba76c929a54646"
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
