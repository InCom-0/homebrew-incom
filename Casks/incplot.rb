cask "incplot" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.3.0"
  sha256 arm:          "0e781b44130730460ee1afa3702ec850eef14ef1b42048f46c4302b74e0935db",
         x86_64:       "4dc1b5025518bebcbe0abe183ec21e2a539abc96913c42cd0523b5a29a21734b",
         arm64_linux:  "6cd01535e21b290fe5d67cde7d8cb9f54559cb16859a121f684fe212db4a40db",
         x86_64_linux: "638ab6424769206bb2df15cfdfeafba9fff43ee0ad99b648ee6778de472bfb68"

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
