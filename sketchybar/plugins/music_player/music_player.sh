#!/bin/bash

### Displays the current track in Apple Music (removed artist for bar space saving)

source "$CONFIG_DIR/icons.sh"
APP="Music"

# Cache file for state tracking
CACHE_FILE="$PLUGIN_DIR/music_player"

# Function to get current state hash for change detection
get_state_hash() {
    local is_running=$(osascript -e "application \"$APP\" is running" 2>/dev/null)
    if [ "$is_running" != "true" ]; then
        echo "not_running"
        return
    fi
    
    local state=$(osascript -e "tell application \"$APP\" to get player state" 2>/dev/null)
    if [ "$state" != "playing" ] && [ "$state" != "paused" ]; then
        echo "stopped"
        return
    fi
    
    local track=$(osascript -e "tell application \"$APP\" to get name of current track" 2>/dev/null)
    echo "${state}_${track}"
}

# Get current and cached states
CURRENT_STATE=$(get_state_hash)
CACHED_STATE=""
if [ -f "$CACHE_FILE" ]; then
    CACHED_STATE=$(cat "$CACHE_FILE")
fi

# Exit early if nothing changed (major battery saver)
if [ "$CURRENT_STATE" = "$CACHED_STATE" ]; then
    exit 0
fi

# Update cache
echo "$CURRENT_STATE" > "$CACHE_FILE"

# Handle different states
case "$CURRENT_STATE" in
    "not_running"|"stopped")
        sketchybar --set "$NAME" icon="$MUSIC_NOTE_SLASH" label="" click_script=""
        ;;
    *)
        # Extract state and track from hash
        STATE=$(echo "$CURRENT_STATE" | cut -d'_' -f1)
        TRACK=$(echo "$CURRENT_STATE" | cut -d'_' -f2-)
        
        # Set icon based on state
        if [ "$STATE" = "paused" ]; then
            ICON="$MUSIC_NOTE_SLASH"
        else
            ICON="$MUSIC_NOTE"
        fi
        
        # Update SketchyBar
        sketchybar --set "$NAME" \
            icon="$ICON" \
            label="$TRACK" \
            click_script="osascript -e 'tell application \"$APP\" to playpause'; $PLUGIN_DIR/music_player/music_player.sh"
        ;;
esac
