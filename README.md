# dotfiles

## sketchybar
This is my configuration of a custom menu bar created using shell scripts and based on the [sketchybar](https://github.com/FelixKratz/SketchyBar) project.

<img width="1922" height="39" alt="Sketchybar Example" src="https://github.com/user-attachments/assets/46284ea4-a0b6-402d-9866-3aa105ff3602" />

### Features
- Snoopy: Added my favourite character sitting on the menu bar to replace the Apple logo and as a personal touch to the mac.
- Front player: Shows the current app that is focused on the screen.
- Music player: A music player for Apple Music showing the current song playing. Clicking on it toggles music on or off.
- Wifi: A wifi symbol that indicates current internet status. Clicking on the icon toggles the wifi on/off.
- Battery: Battery indicator that shows current battery levels and charging status. Clicking on it toggles low power mode and shows the status when switching (with the help of apple shortcuts).
- Volume: Volume indicator with built in volume slider.
- Calendar: Shows the date and time. Clicking on it opens the Apple calendar app.

### Requirements
- Homebrew: Package manager for macOS
- sketchybar: Customizable status bar
- jq: JSON processor
- Space Mono Nerd Font: Font with icons
- sketchybar-app-font: App icon font

### Configuration
- Colors can be easily edited by changing or adding new colors in the colors file and using them in new or exisiting items.
- Items: The visual backbone of how the item will look and what script it will call when clicked.
- Plugins: The functional scripts for their corresponding items. These are what makes the items actually work.
- sketchybarrc: The main file with the structural backbone for the program. Calls all items and groups them into their sections.

### Credits
https://github.com/FelixKratz/SketchyBar
