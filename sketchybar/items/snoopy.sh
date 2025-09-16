#!/bin/bash

### Picture of Snoopy in the place of the logo
# Note: The image is set as the background element

snoopy=(
  #icon="􀣺" # Puts apple logo from SF Symbols
  
  padding_left=$X_BAR_PADDING
  padding_right=10
  icon.drawing=off
  #icon.font="$FONT:Semibold:14.0"
  #icon.color=$FOAM_MOON
  #icon.padding_left=8
  #icon.padding_right=8
  #script="$SCRIPT_POPUP_TOGGLE"
  
  label.drawing=off

  background.drawing=on
  background.image.drawing=on
  background.image=$PLUGIN_DIR/snoopy.png
  background.image.scale=0.015
  background.height=$(($BAR_HEIGHT - 8))
  #background.border_width=2
  #background.border_color=$HIGH_MED_MOON
  #background.color=$OVERLAY_MOON
  #background.corner_radius=20
  #background.drawing=offPOPUP_CLICK_SCRIPT"
  #popup.height=35

)

sketchybar --add item snoopy left \
    --set snoopy "${snoopy[@]}"