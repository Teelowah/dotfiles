#!/bin/bash

### Displays the current track in Apple Music 
# Note: For increased battery saving, increase update_freq to 30s (added cache in music_player plugin file)

source "$CONFIG_DIR/colors.sh"

music_player=(
      # Script settings
      script="$PLUGIN_DIR/music_player/music_player.sh" \
      update_freq=20 \
      #click_script="osascript -e 'tell application \"Music\" to playpause'; $PLUGIN_DIR/music_player/music_player.sh"
      
      # Icon settings
      icon.padding_left=10 \
      icon.color=$IRIS_MOON \

      # Label settings
      label.color=$NEON_GREEN_MOON \
      label.font="SF Pro:Semibold:12.0" \

      # Other settings
      background.padding_right=10 \
      
)          

sketchybar --add item music_player right \
    --set music_player "${music_player[@]}" \
    --subscribe music_player system_woke media_change