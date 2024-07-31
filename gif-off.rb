class GifOff < Formula
  desc "Small CLI for making animated GIFs from folders of images"
  homepage "https://github.com/emorydunn/homebrew-gif-off"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/emorydunn/homebrew-gif-off/releases/download/#{version}/gif-off-arm64.zip"
      sha256 "c29fd1da858ea45950b10f581b94924eda1ee353177508f98257be2db8af4e27"

      def install
        bin.install "gif-off"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/emorydunn/homebrew-gif-off/releases/download/#{version}/gif-off-amd64.zip"
      sha256 "0c382667eb5ba64350a3519132a274b84b29e6600ce2215550d23fa55fc9df12"

      def install
        bin.install "gif-off"
      end
    end
  end

  test do
    system bin/"gif-off", testpath, "--gif", "--dry-run"
  end
end
