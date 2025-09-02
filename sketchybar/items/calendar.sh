#!/bin/bash

calendar=(
        icon="$(date '+%a, %b %d')" # Date in the place of the icon
        label="$(date '+%I:%M %p')" # Time in the place of the label
        icon.font="$FONT:Black:12.0"
        icon.padding_right=15
        icon.padding_left=5
        label.width=50
        label.align=center
        label.padding_left=5
        label.padding_right=16
        background.padding_right=10
        update_freq=30
        script="$PLUGIN_DIR/calendar.sh"

        ### Background of the calendar item
        #background.height=$(($BAR_HEIGHT - 8))
        #background.border_width=2
        #background.border_color=$HIGH_MED_MOON
        #background.color=$OVERLAY_MOON

        # Opens the calendar app if clicked
        click_script="open -a Calendar"
)

sketchybar --add item calendar right \
    --set calendar "${calendar[@]}"

add_separator "1" "right"
    