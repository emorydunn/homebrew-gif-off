class GifOff < Formula
  desc "Small CLI for making animated GIFs from folders of images"
  homepage "https://github.com/emorydunn/homebrew-gif-off"
  version "0.0.2"

  on_macos do
      if Hardware::CPU.arm?
      url "https://github.com/emorydunn/homebrew-gif-off/releases/download/0.0.2/gif-off-arm64.zip"
      sha256 "82d2dad4fe545614ca2a15ca9fb618916420b36293632f61d34f30ff769c9d2b"

        def install
          bin.install "gif-off"
        end
      end
      if Hardware::CPU.intel?
        url "https://github.com/emorydunn/homebrew-gif-off/releases/download/0.0.2/gif-off-amd64.zip"
        sha256 "d0565f5a3b68e1b6c7d8a32050dfd12e9e7987317269553738d7108a3de5cbe8"

        def install
          bin.install "gif-off"
        end
      end
  end
end
