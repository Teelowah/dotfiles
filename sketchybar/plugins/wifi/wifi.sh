#!/bin/bash

source $CONFIG_DIR/colors.sh
source $CONFIG_DIR/icons.sh

ICON_HOTSPOT=􀉤
ICON_WIFI_ERROR=􀙥

#WIFI_PORT="$(networksetup -listallhardwareports | awk '/Hardware Port: Wi-Fi/{getline; print $2}')" # Gets the wifi port

# Gets the wifi name from ipconfig
WIFI_NAME=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}') 

# Checks if the wifi name is empty
if [[ -n "$WIFI_NAME" ]]; then
  ICON=$WIFI_ON
  ICON_COLOR=$BLUE_MOON
  #LABEL="$WIFI_NAME"
else
  # Wifi name is empty (not connected)
  ICON=$WIFI_OFF
  ICON_COLOR=$SUBTLE_MOON
  #LABEL=""
fi

### Updates the wifi item
wifi=(
  icon="$ICON"
  #label="$LABEL"
  icon.color="$ICON_COLOR"
)

sketchybar --set $NAME "${wifi[@]}"


