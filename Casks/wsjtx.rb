cask "wsjtx" do
  version "2.6.1"
  sha256 "faad6f35a550cf56095eae5ff2f9d124c63187bc6ecff324170c2ae06c609e3e"

  url "https://sourceforge.net/projects/wsjt/files/wsjtx-#{version}/wsjtx-#{version}-Darwin.dmg/download",
      verified: "sourceforge.net/projects/wsjt/files/"

  name "WSJT-X"
  desc "Ham radio app implementing communication protocols for weak-signal conditions"
  homepage "https://wsjt.sourceforge.io/wsjtx.html"

  livecheck do
    url :homepage
    regex(/href=.*?wsjtx-(\d+(?:\.\d+)+)-Darwin\.dmg/i)
  end

  depends_on macos: ">= :high_sierra"

  app "wsjtx.app"
  artifact "com.wsjtx.sysctl.plist", target: "/Library/LaunchDaemons/com.wsjtx.sysctl.plist"

  postflight do
    set_ownership("/Library/LaunchDaemons/com.wsjtx.sysctl.plist", user: "root", group: "wheel")
  end

  uninstall delete: "/Library/LaunchDaemons/com.wsjtx.sysctl.plist"

  caveats do
    requires_rosetta
  end

  zap trash: [
    "~/Library/Application Support/WSJT-X",
    "~/Library/Preferences/WSJT-X.ini",
    "~/Library/Saved Application State/org.k1jt.wsjtx.savedState",
  ]

  caveats do
    reboot
  end
end