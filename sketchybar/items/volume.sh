#!/bin/bash

VOLUME_SCRIPT="$PLUGIN_DIR/volume/volume.sh"
VOLUME_CLICK_SCRIPT="$PLUGIN_DIR/volume/volume_click.sh"

volume_slider=(
  script="$VOLUME_SCRIPT"
  updates=on
  padding_left=0
  padding_right=2
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$BLUE_MOON
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$MUTED_MOON
  slider.knob=􀀁
  slider.knob.drawing=off
)

volume_icon=(
  click_script="$VOLUME_CLICK_SCRIPT"
  icon.align=left
  icon.padding_left=$(($OUTER_PADDINGS - 3))
  icon.padding_right=$OUTER_PADDINGS
  icon.color=$FOAM_MOON
  #label.width=32
  label.padding_left=0
  label.padding_right=0
  label.align=left
  label.font="$FONT:Regular:14.0"
)

sketchybar --add slider volume right \
  --set volume "${volume_slider[@]}" \
  --subscribe volume volume_change \
  mouse.clicked \
  mouse.entered \
  mouse.exited \
  \
  --add item volume_icon right \
  --set volume_icon "${volume_icon[@]}"