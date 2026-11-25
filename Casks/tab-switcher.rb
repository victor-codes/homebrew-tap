cask "tab-switcher" do
  version "1.1.3"
  sha256 "df27138f44789cec45afaac81ec09a701f99c9faddf98786b390803bd3db8ebb"

  url "https://github.com/victor-codes/tab-switcher/releases/download/v#{version}/TabSwitcher-#{version}.zip"
  name "Tab Switcher"
  desc "Most-recently-used tab switching for Safari"
  homepage "https://github.com/victor-codes/tab-switcher"

  depends_on macos: :sonoma

  app "Tab Switcher.app"

  uninstall quit: "xyz.ayovictor.tabswitcher"

  zap trash: [
    "~/Library/Containers/xyz.ayovictor.tabswitcher",
    "~/Library/Containers/xyz.ayovictor.tabswitcher.Extension",
    "~/Library/Group Containers/4V436AF4L4.tabswitcher",
  ]

  caveats <<~EOS
    If Safari is open, quit it (Cmd-Q) and open it again after installing or
    upgrading. Until then the extension can't reach the app.

    Open Tab Switcher once, then turn it on in Safari > Settings > Extensions
    and allow it on Other Websites.

    This build is not notarized. If macOS says it can't be opened, run:
      xattr -dr com.apple.quarantine "/Applications/Tab Switcher.app"
    and in Safari > Settings > Developer, turn on "Allow unsigned extensions"
    (Safari resets this each time it quits).
  EOS
end
