cask "incplot" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.3.1"
  sha256 arm:          "46440f1301be6ccb19e26acd80764dfcabb3edcf8f4b37e04eb68fb33a4a3557",
         x86_64:       "d48a38c5de8e0564d74abb83160cf17011785f4f5b44818ed28fd3787100038c",
         arm64_linux:  "31a0598f9589b95df40d2b3090902615e359b723143a3ec9ed65af1e5161793f",
         x86_64_linux: "e113ae512f4fa5e418fc4e5726804cd421700859ed35fcd63558607518a56afc"

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
