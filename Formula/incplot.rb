class Incplot < Formula
  desc "CLI tool to draw great looking plots in the terminal with focus on ergonomics"
  homepage "https://github.com/InCom-0/incplot"
  url "https://github.com/InCom-0/incplot/archive/refs/tags/v0.1.2.zip"
  sha256 "5abf25e6a71a5c173459e39c030378d7a36d333b0c754002cf31e275bed69839"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "ninja" => :build
  depends_on "gcc"

  def install
    system "cmake", "--preset", "gcc_Release", "-DCMAKE_C_COMPILER=#{Formula["gcc"].opt_bin/"gcc-15"}", "-DCMAKE_CXX_COMPILER=#{Formula["gcc"].opt_bin/"g++-15"}", "-DCMAKE_LINKER=/usr/bin/ld", *std_cmake_args, "-DHOMEBREW_ALLOW_FETCHCONTENT=ON"
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test incplot`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system bin/"program", "do", "something"`.
    system "true"
  end
end
