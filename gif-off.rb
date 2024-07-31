class GifOff < Formula
  desc "Small CLI for making animated GIFs from folders of images"
  homepage "https://github.com/emorydunn/homebrew-gif-off"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/emorydunn/homebrew-gif-off/releases/download/#{version}/gif-off-arm64.zip"
      sha256 "8c97e03d55763281496403b8c7b88f97d2a4123ec6a88f7cbdfacc5b8b7891c7"

      def install
        bin.install "gif-off"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/emorydunn/homebrew-gif-off/releases/download/#{version}/gif-off-amd64.zip"
      sha256 "c5d39cfa77055e6a5189793f068dbe3dc40a41cf51c8de243f93bdd95548afc7"

      def install
        bin.install "gif-off"
      end
    end
  end

  test do
    system bin/"gif-off", testpath, "--gif", "--dry-run"
  end
end
