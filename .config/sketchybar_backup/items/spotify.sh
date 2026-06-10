#!/bin/sh

# Spotify item configuration for displaying current track and controls

spotify=(
  label.font="$FONT:Semibold:11.0"
  label.color=$LABEL_COLOR
  display=active
)

spotify_back=(
  icon=􀊎
  drawing=off
)

spotify_playpause=(
  icon=􀊈
  drawing=off
)

spotify_forward=(
  icon=􀊌
  drawing=off
)

# Add main spotify display item
sketchybar --add item spotify center \
           --set spotify "${spotify[@]}" \
           --subscribe spotify spotify_update mouse.entered.global mouse.exited.global

# Add spotify controls
sketchybar --add item spotify.back center \
           --set spotify.back "${spotify_back[@]}" \
           --subscribe spotify.back mouse.clicked \
           \
           --add item spotify.playpause center \
           --set spotify.playpause "${spotify_playpause[@]}" \
           --subscribe spotify.playpause mouse.clicked \
           \
           --add item spotify.forward center \
           --set spotify.forward "${spotify_forward[@]}" \
           --subscribe spotify.forward mouse.clicked

# Assign the plugin script to all items
sketchybar --set spotify script="$PLUGIN_DIR/spotify.sh" \
           --set spotify.back script="$PLUGIN_DIR/spotify.sh" \
           --set spotify.playpause script="$PLUGIN_DIR/spotify.sh" \
           --set spotify.forward script="$PLUGIN_DIR/spotify.sh"
