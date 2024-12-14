cask "sparksdr-preview" do
  version "2.0.975"
  sha256 "ca24ab881e654602835663b341426de01fc6df373ba5084fb82cf1ca2db897ea"

  url "https://www.sparksdr.com/download/SparkSDR.#{version}.osx.zip"
  name "sparksdr"
  desc "Cross platform sdr application for Hermes Lite and Open HPSDR compatible radios (Red Pitya, Apache labs) and SDRplay."
  homepage "https://www.sparksdr.com"

  livecheck do
    url "https://www.sparksdr.com/downloads"
    regex(/Preview Releases<\/h3><h3>(\d+(?:\.\d+)+)/i)
    strategy :page_match
  end

  depends_on macos: ">= :sierra"

  app "SparkSDR.app"

  caveats do
    requires_rosetta
  end

  zap trash: [
    "~/Library/Application Support/SparkSDR",
    "~/Library/Saved Application State/com.sparksdr.SparkSDR.savedState",
  ]
end
