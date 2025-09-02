#!/bin/bash

source "$CONFIG_DIR/colors.sh"

LPM_SHORTCUT_NAME="Toggle Low Power"
PRE_LPM_STATUS="$(pmset -g batt | grep -o 'lowpowermode')" # Gets current LPM status
shortcuts run "$LPM_SHORTCUT_NAME" # Runs the LPM shortcut
sleep 0.5
POST_LPM_STATUS="$(pmset -g | awk '/lowpowermode/ {print $2; exit}')" # Gets new LPM status

# Determine what message to show and colors to use
if [[ $POST_LPM_STATUS != "0" ]]; then
    # Low power mode is now ON
    MESSAGE="LPM ON"
    ICON_COLOR=$GOLD_MOON
else
    # Low power mode is now OFF
    MESSAGE="LPM Off"
    ICON_COLOR=$IRIS_MOON
fi

# Function to create scrolling text effect using sketchybar's scroll_texts
scroll_text() {
    local text="$1"
    local icon_color="$2"
    
    # Enable scroll_texts and set the message with appropriate icon color
    sketchybar --set battery \
        label.scroll_texts=on \
        label="$text" \
        icon.color="$icon_color"
    
    # Keep the message visible for 2 seconds
    sleep 2
    
    # Get current battery percentage for restoration
    PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
    
    # Restore normal battery percentage display and turn off scrolling
    sketchybar --set battery \
        label="${PERCENTAGE}%" \
        label.scroll_texts=off
}

# Show the scrolling message
scroll_text "$MESSAGE" "$ICON_COLOR" &


# Update the battery item to reflect new status immediately
"$PLUGIN_DIR/battery/battery.sh"

