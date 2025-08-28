#!/bin/bash

# Get player status
status=$(playerctl status 2>/dev/null)

# Get media info
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

# Set icon based on status
case $status in
    "Playing")
        icon="⏸"  # Pause icon when playing
        ;;
    "Paused")
        icon="▶"  # Play icon when paused
        ;;
    *)
        icon="🎵"  # Default music icon
        ;;
esac

# Format text
if [[ -n "$artist" && -n "$title" ]]; then
    text="$artist - $title"
elif [[ -n "$title" ]]; then
    text="$title"
else
    text="No media"
fi

# Output JSON for waybar with correct format
echo "{\"text\":\"$icon $text\", \"class\":\"$status\"}"