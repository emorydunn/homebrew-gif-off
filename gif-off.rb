class GifOff < Formula
  desc "Small CLI for making animated GIFs from folders of images"
  homepage "https://github.com/emorydunn/homebrew-gif-off"
  version "0.0.2"

  on_macos do
      if Hardware::CPU.arm?
      url "https://github.com/emorydunn/homebrew-gif-off/releases/download/0.0.2/gif-off-arm64.zip"
      sha256 "fa96b7aadb17828022d1f8b2a77b6df300030571f242442d758355fbdd752292"

        def install
          bin.install "gif-off"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/emorydunn/homebrew-gif-off/releases/download/0.0.2/gif-off-amd64.zip"
        sha256 "0b7443656abd8f61b5fbbe4a83adaee85adffe88e0b79fa42a260ee9d1f7698d"

        def install
          bin.install "gif-off"
        end
      end
  end
end
