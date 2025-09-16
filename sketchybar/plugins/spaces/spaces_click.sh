#!/bin/bash

SPACE_NUMBER=$1

if [ -z "$SPACE_NUMBER" ]; then
    echo "Usage: $0 <space_number>"
    exit 1
fi

# Method 1: Using Mission Control AppleScript (most reliable)
osascript -e "
tell application \"System Events\"
    tell dock preferences
        set autohide to true
    end tell
    key code 126 using {control down} -- Ctrl+Up to open Mission Control
    delay 0.3
    key code $(($SPACE_NUMBER + 17)) -- Number keys start at keycode 18 (key 1)
end tell
"

# Method 2: Alternative using desktop switching (uncomment to use instead)
# osascript -e "
# tell application \"System Events\"
#     set currentDesktop to current desktop
#     set targetDesktop to desktop $SPACE_NUMBER
#     if currentDesktop is not targetDesktop then
#         set current desktop to targetDesktop
#     end if
# end tell
# "

# Method 3: Using Shortcuts (if you have shortcuts set up) 
# Requires keyboard shortcuts to be set in System Preferences > Keyboard > Shortcuts > Mission Control
# osascript -e "
# tell application \"System Events\"
#     key code $(($SPACE_NUMBER + 17)) using {control down}
# end tell
# "