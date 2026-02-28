class GitSame < Formula
  desc "Discover and mirror GitHub org/repo structures locally"
  homepage "https://github.com/zaai-com/git-same"
  version "2.0.0"
  license "MIT"

  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/2.0.0/git-same-macos-aarch64"
      sha256 "e6277f24f7e346143b56cac91fe706161a8c17f5f7901ae3eea65a4bfacca6ae"
    else
      url "https://github.com/zaai-com/git-same/releases/download/2.0.0/git-same-macos-x86_64"
      sha256 "bd71182dd9e90fc6ff78b159c7046c6d0c82d921570c5c0016933e00597bdeee"
    end
  elsif OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/zaai-com/git-same/releases/download/2.0.0/git-same-linux-aarch64"
      sha256 "ff78c3b98bdb96a692697fada4e96c85cd01f285452e3d7abdd72af18ede4f7a"
    else
      url "https://github.com/zaai-com/git-same/releases/download/2.0.0/git-same-linux-x86_64"
      sha256 "82800abf702c0c26e876ad24db593307d48cf6179de55d27f8de88f694efc494"
    end
  end

  def install
    if OS.mac?
      bin.install "git-same-macos-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}" => "git-same"
    elsif OS.linux?
      bin.install "git-same-linux-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}" => "git-same"
    end
    bin.install_symlink "git-same" => "gitsame"
    bin.install_symlink "git-same" => "gitsa"
    bin.install_symlink "git-same" => "gisa"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/git-same --version")
    assert_match version.to_s, shell_output("#{bin}/gitsame --version")
    assert_match version.to_s, shell_output("#{bin}/gitsa --version")
    assert_match version.to_s, shell_output("#{bin}/gisa --version")
  end
end
