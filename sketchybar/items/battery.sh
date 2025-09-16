#!/bin/bash

### Displays the current battery percentage
# Note: When clicked runs the low power mode shortcut

source "$CONFIG_DIR/colors.sh"

battery=(
    
    # Icon settings
    icon.font="$FONT:Regular:16.0"
    icon.padding_left=$(($OUTER_PADDINGS - 1))
    icon.padding_right=$(($INNER_PADDINGS - 2))
    icon.color=$IRIS_MOON
    
    # Label settings
    label="${PERCENTAGE}%"
    label.font="$FONT:Semibold:10.0"
    label.padding_left=$(($INNER_PADDINGS - 2))
    #label.padding_right=$(($OUTER_PADDINGS + 2))
    #label.color=$TEXT_MOON
    
    # Other settings
    update_freq=90
    updates=on
    script="$PLUGIN_DIR/battery/battery.sh"
    click_script="$PLUGIN_DIR/battery/battery_click.sh"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}"\
           --subscribe battery system_woke power_source_change

#add_separator "1" "right"

