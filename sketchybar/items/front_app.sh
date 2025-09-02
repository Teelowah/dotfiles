#!/bin/bash

front_app=(
     background.color=$ACCENT_COLOR
     icon.color=$FOAM_MOON 
     icon.font="sketchybar-app-font:Regular:16.0"
     label.color="$TEXT_MOON"
     script="$PLUGIN_DIR/front_app.sh"
)

sketchybar --add item front_app left \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched