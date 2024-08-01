class GifOff < Formula
  desc "Small CLI for making animated GIFs from folders of images"
  homepage "https://github.com/emorydunn/homebrew-gif-off"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/emorydunn/homebrew-gif-off/releases/download/#{version}/gif-off-arm64.zip"
      sha256 "5f0c893ea33d6f2a45d442c617cb6a51b19af058f08056aa104903ab0e467fc9"

      def install
        bin.install "gif-off"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/emorydunn/homebrew-gif-off/releases/download/#{version}/gif-off-amd64.zip"
      sha256 "1e50c93a3903732d95ce8f236cb5ae5e030e4501f5b51c6db6926d0b918bebaf"

      def install
        bin.install "gif-off"
      end
    end
  end

  test do
    system bin/"gif-off", testpath, "-a", "gif", "--dry-run"
  end
end
