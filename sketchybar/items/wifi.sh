#!/bin/bash

### Displays the current WiFi status
# Note: When clicked turns WiFi on/off

source "$CONFIG_DIR/colors.sh"

wifi=(
  # Script settings
  script="$PLUGIN_DIR/wifi/wifi.sh"
  click_script="$PLUGIN_DIR/wifi/wifi_click.sh"
  update_freq=90

  # Icon settings
  icon.color=$SUBTLE_MOON
  icon.padding_right=0

  # Label settings
  #label.max_chars=10
  #label.font="$FONT:Semibold:10.0"

  # Other settings
  padding_left=0
  padding_right=0
)

sketchybar --add item wifi right \
  --set wifi "${wifi[@]}" \
  --subscribe wifi wifi_change