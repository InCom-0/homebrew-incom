cask "incplot" do

  arch arm: "arm64", intel: "x86_64"

  version "0.1.2"
  sha256 arm:   "d577e29c410c402de918d3b381f2c844195e684de090a95163ef982999fed9c7",
         intel: "24edbcf137431f546ee441422727268574332475cee4a0e8b19e5b2c7e8ebd15"

  url "https://github.com/InCom-0/incplot/releases/download/#{version}/incplot_macos_#{arch}.tar.gz"
  name "incplot"
  desc "CLI tool to draw great looking plots in the terminal with focus on ergonomics"
  homepage "https://github.com/InCom-0/incplot"


  livecheck do
    url :url
    regex(/^v?\.?(\d+(?:\.\d+)+)$/i)
  end

  binary "incplot_macos_#{arch}/bin/incplot"

  # No zap stanza required
end