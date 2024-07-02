class Multiping < Formula
  desc "Tool to monitor several targets at once using icmp or tcp with minimum deps"
  homepage "https://github.com/babs/multiping/"
  url "https://github.com/babs/multiping/archive/refs/tags/v1.3.0.tar.gz"
  sha256 "9468c9a563f7b72efa76d563bcd7e473cecb497793ea07e32c368d14799a5de5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/babs/multiping/releases/download/v1.3.0/multiping-darwin-arm64.xz"
      sha256 "0090b76edd88dcaceed8575379dcec800dd7b770d3b231fe65368ab551e27763"

      def install
        bin.install "multiping-darwin-arm64" => "multiping"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/babs/multiping/releases/download/v1.3.0/multiping-darwin-amd64.xz"
      sha256 "22015a5de7397d90d8ae7abcec6a7ddafcd7c92f76e25283959415feb32fa13f"

      def install
        bin.install "multiping-darwin-amd64" => "multiping"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/babs/multiping/releases/download/v1.3.0/multiping-linux-arm64.xz"
      sha256 "b7ecd0e9882d2243944ecf39febf6e0f71612e6ef235bd1e08ca053fc37eac16"

      def install
        bin.install "multiping-linux-arm64" => "multiping"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/babs/multiping/releases/download/v1.3.0/multiping-linux-amd64.xz"
      sha256 "4f123a76fbc9df29236fbf734339a0787f2c95e8b524488a9425376feba349be"

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
