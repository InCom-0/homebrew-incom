class Incplot < Formula
  desc "CLI tool for drawing great looking plots in the terminal and in HTML"
  homepage "https://github.com/InCom-0/incplot"
  url "https://github.com/InCom-0/incplot/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "e659b93de71564cedb728d2ea2d49851ff5a592b9a34a2e564edd95a8c55379d"
  license "MIT"

  livecheck do
    url :stable
    regex(/^v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on "argparse" => :build
  depends_on "cmake" => :build
  depends_on "indicators" => :build
  depends_on "magic_enum" => :build
  depends_on "ninja" => :build
  depends_on "nlohmann-json" => :build

  depends_on "cpr"
  depends_on "fontconfig"
  depends_on "harfbuzz"
  depends_on "libarchive"
  depends_on "sqlite"
  depends_on "woff2"
  depends_on "xxhash"
  depends_on "zlib"

  resource "incplot-lib" do
    url "https://github.com/InCom-0/incplot-lib.git", using: :git, revision: "31c11b3e85d3720c03691b7737d9f75cee303815"
  end

  resource "incstd" do
    url "https://github.com/InCom-0/incstd.git", using: :git, revision: "815a2a38d23441f9de1015b79b5e3c05bafbb157"
  end

  resource "more_concepts" do
    url "https://github.com/MiSo1289/more_concepts.git", using: :git, revision: "ea5b6815f5929cdb086f76d43f3e9b122bbcaaeb"
  end

  resource "incerr" do
    url "https://github.com/InCom-0/incerr.git", using: :git, revision: "e58ddf602e1f475e6da86c3795d194c1e47abfdf"
  end

  resource "otfccxx" do
    url "https://github.com/InCom-0/otfccxx.git", using: :git, revision: "c3de0e3da29e9fff336e824063dd146b644475a7"
  end

  resource "ots_cmake" do
    url "https://github.com/InCom-0/ots_cmake.git", using: :git, revision: "74becafededb6a520328dff82c16f75f0fdb7a2d"
  end

  resource "incfontdisc" do
    url "https://github.com/InCom-0/incfontdisc.git", using: :git, revision: "d13c483be49fcabb5a7650e32d699ef041b6092c"
  end

  resource "libarchive_superbuild" do
    url "https://github.com/InCom-0/libarchive_superbuild.git", using: :git, revision: "97a5dd7312f03f6d5b1d3877e1de02b8cd112a72"
  end

  resource "sqlpp23" do
    url "https://github.com/rbock/sqlpp23.git", using: :git, revision: "98924536db64b7bfc3a138f6ecf9bd47f60c81da"
  end

  def install
    resources.each do |resource|
      resource.stage buildpath/resource.name
    end

    preset_arg = %w[
      --preset clang_Release
    ]
    if OS.linux?
      preset_arg = %w[
        --preset gcc_Release
      ]
    end

    args = %W[
      -D HOMEBREW_ALLOW_FETCHCONTENT=ON
      -D CPM_LOCAL_PACKAGES_ONLY=ON
      -D CPM_incplot-lib_SOURCE=#{buildpath/"incplot-lib"}
      -D CPM_incstd_SOURCE=#{buildpath/"incstd"}
      -D CPM_more_concepts_SOURCE=#{buildpath/"more_concepts"}
      -D CPM_incerr_SOURCE=#{buildpath/"incerr"}
      -D CPM_otfccxx_SOURCE=#{buildpath/"otfccxx"}
      -D CPM_ots_SOURCE=#{buildpath/"ots_cmake"}
      -D CPM_incfontdisc_SOURCE=#{buildpath/"incfontdisc"}
      -D CPM_libarchive_superbuild_SOURCE=#{buildpath/"libarchive_superbuild"}
      -D CPM_sqlpp23_SOURCE=#{buildpath/"sqlpp23"}
      -Wno-dev
    ]

    system "cmake", "-S", ".", *preset_arg, *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match version.to_s,
      pipe_output("#{bin}/incplot -v", nil)
  end
end
