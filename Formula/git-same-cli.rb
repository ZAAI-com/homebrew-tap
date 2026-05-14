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
      url "https://github.com/zaai-com/git-same/releases/download/3.0.2/git-same-3.0.2-aarch64-apple-darwin.tar.gz"
      sha256 "90ed2958704c4381913e09a83f2a4e2953fdd804fbd849ce561e558b5d075ef6"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.0.2/git-same-3.0.2-x86_64-apple-darwin.tar.gz"
      sha256 "3aeee01f70c0107b6fe8940d95579858d48d223469315b5c8bdbc105593cbd6a"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/3.0.2/git-same-3.0.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "20e29530f99b47667da945cc3a822e7f283dfd4e55ca9569f32b407d42f6c56c"
    else
      url "https://github.com/zaai-com/git-same/releases/download/3.0.2/git-same-3.0.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ca3dcf734e10c6611b3259ec36164cfa39527c23b35012de827f3e9f8946ca8"
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
