# MacOS Commands

-   Toggle Spotlight indexing:
    -   `sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist`
    -   `sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist`
-   Flush DNS Cache:
    -   `sudo killall -HUP mDNSResponder`
