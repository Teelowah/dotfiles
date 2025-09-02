#!/bin/bash

# Get current WiFi status
WIFI_STATUS=$(networksetup -getairportpower en0 | awk '{print $4}')

if [[ $WIFI_STATUS == "On" ]]; then
    # Turn WiFi off
    networksetup -setairportpower en0 off
else
    # Turn WiFi on
    networksetup -setairportpower en0 on
fi

# Rerun the wifi script to update the bar icon
"$PLUGIN_DIR/wifi/wifi.sh"