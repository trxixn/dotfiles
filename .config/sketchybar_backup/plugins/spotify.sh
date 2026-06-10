#!/bin/bash

# Get the current Spotify state and song information
get_spotify_info() {
  osascript -e 'tell application "Spotify"
    if it is running then
      set player_state to player state as string
      set current_track to name of current track as string
      set current_artist to artist of current track as string
      set is_playing to player_state is equal to "playing"
      return current_track & " - " & current_artist & "|" & is_playing
    else
      return "Spotify not running"
    end if
  end tell'
}

# Handle mouse clicks for play/pause
spotify_play_pause() {
  osascript -e 'tell application "Spotify" to playpause'
}

# Handle next track
spotify_next() {
  osascript -e 'tell application "Spotify" to next track'
}

# Handle previous track
spotify_back() {
  osascript -e 'tell application "Spotify" to previous track'
}

# Main display update for spotify item only
update_spotify() {
  source "$CONFIG_DIR/icons.sh"
  
  SPOTIFY_INFO=$(get_spotify_info)
  
  if [[ "$SPOTIFY_INFO" == "Spotify not running" ]]; then
    sketchybar --set "$NAME" label="Spotify not running" icon="" drawing=on
  else
    TRACK_INFO=$(echo "$SPOTIFY_INFO" | cut -d'|' -f1)
    IS_PLAYING=$(echo "$SPOTIFY_INFO" | cut -d'|' -f2)
    
    # Truncate long track names for display
    if [ ${#TRACK_INFO} -gt 40 ]; then
      TRACK_INFO="${TRACK_INFO:0:37}..."
    fi
    
    # Set the play/pause icon based on state
    if [ "$IS_PLAYING" = "true" ]; then
      PLAY_ICON="▶"
    else
      PLAY_ICON="⏸"
    fi
    
    sketchybar --set "$NAME" label="$TRACK_INFO" icon="$PLAY_ICON" drawing=on
  fi
}

# Handle different events based on which item is calling
case "$SENDER" in
  "spotify_update"|"forced")
    # Only update display if this is the main spotify item
    if [ "$NAME" = "spotify" ]; then
      update_spotify
    fi
    ;;
  "mouse.clicked")
    # Only handle clicks for control items
    if [ "$NAME" = "spotify.playpause" ]; then
      spotify_play_pause
      sleep 0.5
      sketchybar --trigger spotify_update
    elif [ "$NAME" = "spotify.forward" ]; then
      spotify_next
      sleep 0.5
      sketchybar --trigger spotify_update
    elif [ "$NAME" = "spotify.back" ]; then
      spotify_back
      sleep 0.5
      sketchybar --trigger spotify_update
    fi
    ;;
  "mouse.entered.global")
    # Show controls on hover only for main spotify item
    if [ "$NAME" = "spotify" ]; then
      sketchybar --set spotify.playpause drawing=on \
                 --set spotify.forward drawing=on \
                 --set spotify.back drawing=on
    fi
    ;;
  "mouse.exited.global")
    # Hide controls when not hovering
    if [ "$NAME" = "spotify" ]; then
      sketchybar --set spotify.playpause drawing=off \
                 --set spotify.forward drawing=off \
                 --set spotify.back drawing=off
    fi
    ;;
esac
