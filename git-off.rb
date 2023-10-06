class GitOff < Formula
desc "Small CLI for making animated GIFs from folders of images."
homepage "https://github.com/emorydunn/homebrew-git-off.git"
version "0.0.1"

on_macos do
    if Hardware::CPU.arm?
    url "https://github.com/emorydunn/homebrew-git-off/releases/download/0.0.1/gif-off-arm64.zip"
    sha256 "6e264115843e6e9f33118a25d2134341c33b165397439adc6a8a59892ebc8b4f"

      def install
        bin.install "git-off"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/emorydunn/homebrew-git-off/releases/download/0.0.1/gif-off-amd64.zip"
      sha256 "23bf9be3cea8120c87efda617cb4f7ba314ea5fe40b7577ba9913784e56858a3"

      def install
        bin.install "git-off"
      end
    end

end

def caveats
    <<~EOS
        See the Github repository for more information
    EOS
end
end
