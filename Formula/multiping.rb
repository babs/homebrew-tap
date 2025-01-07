class Multiping < Formula
  desc "Tool to monitor several targets at once using icmp or tcp with minimum deps"
  homepage "https://github.com/babs/multiping/"
  url "https://github.com/babs/multiping/archive/refs/tags/v1.4.0.tar.gz"
  sha256 "ed201b6be5fb0c102ab6f8696429fe4ccb892673f0559f1a5661b9d6dd11270d"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/babs/multiping/releases/download/v1.4.0/multiping-darwin-arm64.xz"
      sha256 "0e3dff5279674201f32169384268efbb733cd6c931b18a6088560883970a9def"

      def install
        bin.install "multiping-darwin-arm64" => "multiping"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/babs/multiping/releases/download/v1.4.0/multiping-darwin-amd64.xz"
      sha256 "38ee756348f92218b877296890c1231603f17121a99e5887f1eac0358cb46428"

      def install
        bin.install "multiping-darwin-amd64" => "multiping"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/babs/multiping/releases/download/v1.4.0/multiping-linux-arm64.xz"
      sha256 "247267a01a39d71088842fe21939549b88b102699fc8feaa7ec2c22fd4c33db3"

      def install
        bin.install "multiping-linux-arm64" => "multiping"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/babs/multiping/releases/download/v1.4.0/multiping-linux-amd64.xz"
      sha256 "d11e5081041fd1dcfc42c72a2ab03b2d75f03634635761cc31a33175eda51501"

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
