cask "sdrpp" do
  version "1.2.1"
  sha256 :no_check
  arch arm: "arm", intel: "intel"

  url "https://github.com/AlexandreRouma/SDRPlusPlus/releases/download/nightly/sdrpp_macos_#{arch}.zip",
      verified: "github.com/AlexandreRouma/SDRPlusPlus/"

  name "sdrpp"
  desc "SDR++ is a cross-platform and open source SDR software with the aim of being bloat free and simple to use."
  homepage "https://www.sdrpp.org/"

  livecheck do
    url "https://github.com/AlexandreRouma/SDRPlusPlus/releases/tag/nightly"
    regex(/SDR\+\+ Nightly Build \(currently (\d+(?:\.\d+)+)\)/i)
    strategy :page_match
  end

  app "SDR++.app"

  zap trash: [
    "~/Library/Application Support/sdrpp",
    "~/Library/Saved Application State/oorg.sdrpp.sdrpp.savedState",
  ]
end
