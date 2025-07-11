cask "incplot" do
  arch arm: "arm64", intel: "x86_64"
  os macos: "macos", linux: "linux"

  version "0.1.6"
  sha256 arm:          "22d2f48a4da706ba311fce91d2254e30affa1256f19195c36c476c2f4a740ee4",
         x86_64:       "abcdcbc8f7c01d663a2b7dcfccfa2b170ad4c4888a7ecbd6309e45be63bd99af",
         arm64_linux:  "44aec9c574c55a7a0e96a4e1688133ac380bba29ec8b610f34069bb475fac089",
         x86_64_linux: "a1a08e2fa9c878251ccaf164e5aee478408aed9cc106d09021d4327cbfbbc5c2"

  url "https://github.com/InCom-0/incplot/releases/download/v#{version}/incplot_#{os}_#{arch}.tar.gz"
  name "incplot"
  desc "CLI tool to draw great looking plots in the terminal with focus on ergonomics"
  homepage "https://github.com/InCom-0/incplot"

  livecheck do
    url :url
    regex(/^v?\.?(\d+(?:\.\d+)+)$/i)
  end

  depends_on formula: "gcc"

  binary "incplot_#{os}_#{arch}/bin/incplot"

  # No zap stanza required
end
