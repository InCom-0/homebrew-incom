cask "incplot" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.1.2"
  sha256 arm:          "d577e29c410c402de918d3b381f2c844195e684de090a95163ef982999fed9c7",
         x86_64:       "24edbcf137431f546ee441422727268574332475cee4a0e8b19e5b2c7e8ebd15",
         arm64_linux:  "ccc7587c0c35834c4b76b825692aa8b1d22e6555eb17863f46d61237e7d4ba3d",
         x86_64_linux: "fa13f2d06157faa8fa4f3dce12c1e29c7a6ca9d26a5622d4271486b39315296d"

  url "https://github.com/InCom-0/incplot/releases/download/v#{version}/incplot_#{os}_#{arch}.tar.gz"
  name "incplot"
  desc "CLI tool to draw great looking plots in the terminal with focus on ergonomics"
  homepage "https://github.com/InCom-0/incplot"
  

  livecheck do
    url :url
    regex(/^v?\.?(\d+(?:\.\d+)+)$/i)
  end

  binary "incplot_#{os}_#{arch}/bin/incplot"

  # No zap stanza required
end
