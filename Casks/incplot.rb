cask "incplot" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.2.0"
  sha256 arm:          "6c4d8c0981359fa0520b415c51ed687fb8d23dd8a04b3789d95f025af45f15e1",
         x86_64:       "fe7ebb3dae17b3b46b9a5ef0d1a956721f21bf21b0bb672d36cea2fbb346a55d",
         arm64_linux:  "d0818927f19d81a453ec2a84a6354efd8c5a05773dac63771b69d57b2fcdc9df",
         x86_64_linux: "6cc6d3ad8bef9dc38ea3af0b44e58c42ed784ea9beffef9f0d4a45340d946c71"

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
