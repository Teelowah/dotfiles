#!/bin/bash

source "$CONFIG_DIR/colors.sh"

battery=(
    script="$PLUGIN_DIR/battery/battery.sh"
    #icon=􀺸
    icon.font="$FONT:Regular:16.0"
    icon.padding_left=$(($OUTER_PADDINGS - 1))
    icon.padding_right=$(($INNER_PADDINGS - 2))
    icon.color=$IRIS_MOON
    label="${PERCENTAGE}%"
    label.font="$FONT:Semibold:10.0"
    label.padding_left=$(($INNER_PADDINGS - 2))
    #label.padding_right=$(($OUTER_PADDINGS + 2))
    #label.color=$TEXT_MOON
    update_freq=90
    updates=on
    #scroll_texts=on
    #scroll_duration=100
    click_script="$PLUGIN_DIR/battery/battery_click.sh"
)

sketchybar --add item battery right \
           --set battery "${battery[@]}"\
           --subscribe battery system_woke power_source_change

add_separator "1" "right"

