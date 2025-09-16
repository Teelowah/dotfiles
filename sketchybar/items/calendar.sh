#!/bin/bash

### Displays date and time, opens calendar app if clicked

calendar=(
        icon="$(date '+%a, %b %d')" # Date in the place of the icon
        label="$(date '+%I:%M %p')" # Time in the place of the label
        
        # Icon settings
        icon.font="$FONT:Black:12.0"
        icon.padding_right=15
        icon.padding_left=5
        
        # Label settings
        label.width=50
        label.align=center
        label.padding_left=5
        label.padding_right=16
        
        # Other settings
        background.padding_right=10
        update_freq=30
        script="$PLUGIN_DIR/calendar.sh"
        click_script="open -a Calendar" # Opens the calendar app if clicked
        
        ### Background of the calendar item
        #background.height=$(($BAR_HEIGHT - 8))
        #background.border_width=2
        #background.border_color=$HIGH_MED_MOON
        #background.color=$OVERLAY_MOON
)

sketchybar --add item calendar right \
    --set calendar "${calendar[@]}"

add_separator "1" "right"
    