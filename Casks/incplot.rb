cask "incplot" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.2.1"
  sha256 arm:          "b90ee6b37abfb6cbf2f921d5f98f6b2b031dfac7f2ff2fab602cf58d4380fd7b",
         x86_64:       "b5bfb9fa9a1aef1908b2cee4bcd602ff19861484e8f949c5cceac1587f1fdc54",
         arm64_linux:  "2d9ee0c3bd55afbb2caa434fb437864f397aee103866ee6993ed5d0e536291f4",
         x86_64_linux: "62d6978c96bf321b19345a710384aae6b076da5f17331a5acd09b4d65853dc7a"

  url "https://github.com/InCom-0/incplot/releases/download/v#{version}/incplot_#{os}_#{arch}.tar.gz"
  name "incplot"
  desc "CLI tool drawing great looking plots in the terminal focused on simplicity"
  homepage "https://github.com/InCom-0/incplot"

  livecheck do
    url :url
    regex(/^v?\.?(\d+(?:\.\d+)+)$/i)
  end

  depends_on formula: "gcc"

  binary "incplot_#{os}_#{arch}/bin/incplot"

  # No zap stanza required
end
