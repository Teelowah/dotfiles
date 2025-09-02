#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Bash array for wifi configurations
wifi=(
  script="$PLUGIN_DIR/wifi/wifi.sh"
  click_script="$PLUGIN_DIR/wifi/wifi_click.sh"

  icon.color=$SUBTLE_MOON
  icon.padding_right=0
  label.max_chars=10
  label.font="$FONT:Semibold:10.0"
  padding_left=0
  padding_right=0
)

sketchybar --add item wifi right \
  --set wifi "${wifi[@]}" \
  --subscribe wifi wifi_change