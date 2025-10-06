cask "incplot" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.3.2"
  sha256 arm:          "4cd98acf4115dd13795985fd4398045aa9778de66ec161151319c0fb3b11b845",
         x86_64:       "1bab9f3a2f17458cb5ca6430e30dd6c291e315ae49958619475dbcf830926ce3",
         arm64_linux:  "f9e6d67ba4ccedfa5d2353886d9f6db8eb7907bf387084322d1df482e0bc1fde",
         x86_64_linux: "38f1b5f54f41c593796aed8e601380a5c0a4eecaad1206fecb2bcc3c49678b2a"

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
