#!/bin/bash
# Scripts Launcher - Your personal scripts only

# Simple menu with your scripts (no emojis for better compatibility)
SCRIPTS="PhoneCam\nFlipCam"

choice=$(echo -e "$SCRIPTS" | rofi -dmenu \
    -theme ~/.config/rofi/applets/styles/launcher.rasi \
    -p "Execute" \
    -no-show-icons \
    -markup-rows \
    -i \
    -matching fuzzy)

case "$choice" in
    "PhoneCam") 
        kitty -e fish -c "phonecam; read" &
        ;;
    "FlipCam") 
        kitty -e fish -c "flipcam; read" &
        ;;
esac