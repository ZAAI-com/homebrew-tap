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
      url "https://github.com/zaai-com/git-same/releases/download/3.1.2/git-same-3.1.2-aarch64-apple-darwin.tar.gz"
      sha256 "506209839723bb7a4abc55ead7beff205709e13a7f03e001cdf7bab40f8cbfe0"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.1.2/git-same-3.1.2-x86_64-apple-darwin.tar.gz"
      sha256 "852ba21e6e17db859445301cc0d5c7dd3031e519bc941c6167ccba5e35e5cdd0"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/3.1.2/git-same-3.1.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a8081983e590e6a849fdf13d4d38d1c5db7876ae890a1bb521c7b17a414c7047"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.1.2/git-same-3.1.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a31bce8a3b01e3bcc24ea62164364bd63eefb0f74a31c8e75fdaa75b1a51e86c"
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
