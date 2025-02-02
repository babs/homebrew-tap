class Multiping < Formula
  desc "Tool to monitor several targets at once using icmp or tcp with minimum deps"
  homepage "https://github.com/babs/multiping/"
  url "https://github.com/babs/multiping/archive/refs/tags/v1.5.0.tar.gz"
  version "1.5.0"
  sha256 "ed201b6be5fb0c102ab6f8696429fe4ccb892673f0559f1a5661b9d6dd11270d"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/babs/multiping/releases/download/v1.5.0/multiping-darwin-arm64.xz"
      sha256 "a5ddefd5937bc493a5bacdba4b3a646e7afda5eb2b1c991ebd9a10bd890fe01f"

      def install
        bin.install "multiping-darwin-arm64" => "multiping"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/babs/multiping/releases/download/v1.5.0/multiping-darwin-amd64.xz"
      sha256 "3a6f50757554aeef10653c26e3134c6850cfab69ebb702d4c6ac806872ca8f5d"

      def install
        bin.install "multiping-darwin-amd64" => "multiping"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/babs/multiping/releases/download/v1.5.0/multiping-linux-arm64.xz"
      sha256 "fce49c17a11bb5755d8b2ee0537ef8340a83436fec0d301a182ac45e2682a900"

      def install
        bin.install "multiping-linux-arm64" => "multiping"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/babs/multiping/releases/download/v1.5.0/multiping-linux-amd64.xz"
      sha256 "de85cea73f062056d5dc3d05bbfa0d94b2fb228a7b6b9c72ae52f1f77df1d0af"

      def install
        bin.install "multiping-linux-amd64" => "multiping"
      end
    end
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test multiping`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
