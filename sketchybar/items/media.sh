#!/bin/bash

media=(
  icon.background.drawing=on
  icon.background.image=media.artwork
  icon.background.image.corner_radius=9
  script="$PLUGIN_DIR/media.sh"
  label.max_chars=15
  scroll_texts=on
  updates=on
)

sketchybar --add item media -e left \
           --set media "${media[@]}" \
           --subscribe media media_change

#label.color=$ACCENT_COLOR \
                       #label.max_chars=20 \
                       #icon.padding_left=0 \
                       #scroll_texts=on \
                       #icon=􀑪          \
                       #icon.color=$ACCENT_COLOR   \
                       #background.drawing=off \
                       #script="$PLUGIN_DIR/media.sh" \