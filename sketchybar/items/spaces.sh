#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Variables
ICON_FONT="sketchybar-app-font"
BRAVE_ICON="$($PLUGIN_DIR/icon_map_fn.sh "Brave Browser")"
ZEN_ICON="$($PLUGIN_DIR/icon_map_fn.sh "Zen")"
OBSIDIAN_ICON="$($PLUGIN_DIR/icon_map_fn.sh "Obsidian")"
MUSIC_ICON="$($PLUGIN_DIR/icon_map_fn.sh "Music")"

##### Adding Mission Control Space Indicators #####
SPACE_ICONS=("$BRAVE_ICON" "$ZEN_ICON" "$OBSIDIAN_ICON" "$MUSIC_ICON" "5" "6" "7" "8" "9" "10")
SPACE_LABELS=("Brave" "Zen" "Obsidian" "Music" "" "" "" "" "" "")


for i in "${!SPACE_ICONS[@]}"
do
    sid="$(($i+1))"
    space=(
        space="$sid"

        #Icon settings
        icon="${SPACE_ICONS[i]}"
        icon.color=$NEON_GREEN_MOON
        icon.font="$ICON_FONT:Regular:16.0"
        icon.padding_left=7
        icon.padding_right=7
        
        #Label settings
        label="${SPACE_LABELS[i]}"
        label.drawing=on
        label.color=$TEXT_MOON
        label.font="$FONT:Semibsold:12.0"
        label.padding_right=8

        #Background settings
        background.height=$(($BAR_HEIGHT - 8))
        background.border_width=2
        background.border_color=$HIGH_MED_MOON
        background.color=$SURFACE_MOON
        background.corner_radius=15
        background.blur_radius=24

        script="$PLUGIN_DIR/spaces/spaces.sh"
        #click_script="$PLUGIN_DIR/spaces/spaces_click.sh"
    )
    sketchybar --add space space."$sid" left --set space."$sid" "${space[@]}"
done