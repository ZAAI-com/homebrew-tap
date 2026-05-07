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
      url "https://github.com/zaai-com/git-same/releases/download/3.0.1/git-same-3.0.1-aarch64-apple-darwin.tar.gz"
      sha256 "3976afe3d8ad0d117253be21d2b775f84c9746045c407dda25621c43c9397274"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.0.1/git-same-3.0.1-x86_64-apple-darwin.tar.gz"
      sha256 "cf24f3a293100bce6bdfebe154fc6ba6e831db26011ea1c5e4ba5b5a470a509e"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/3.0.1/git-same-3.0.1-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0d6345d1861e00129aec5b07f773ccc87e8eb316fc38ca02b6829b0bb36ce0d"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.0.1/git-same-3.0.1-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bac09058e2d8e105b60a99e070c3228084a971ef9ad83718faf896f6d95c437"
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
