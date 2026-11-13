cask "tab-switcher" do
  version "0.0.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/victor-codes/tab-switcher/releases/download/v#{version}/TabSwitcher-#{version}.zip"
  name "Tab Switcher"
  desc "Most-recently-used tab switching for Safari"
  homepage "https://github.com/victor-codes/tab-switcher"

  depends_on macos: :sonoma

  app "Tab Switcher.app"

  uninstall quit: "com.example.tabflip"

  zap trash: [
    "~/Library/Containers/com.example.tabflip",
    "~/Library/Containers/com.example.tabflip.Extension",
    "~/Library/Group Containers/4V436AF4L4.tabflip",
  ]

  caveats <<~EOS
    Open Tab Switcher once, then turn it on in Safari > Settings > Extensions
    and allow it on Other Websites.

    This build is not notarized. If macOS says it can't be opened, run:
      xattr -dr com.apple.quarantine "/Applications/Tab Switcher.app"
    and in Safari > Settings > Developer, turn on "Allow unsigned extensions"
    (Safari resets this each time it quits).
  EOS
end
