#!/bin/bash
# Games Launcher - Only your games

# Simple menu with ONLY games
GAMES="Brawlhalla\nGrandChase\nStumble Guys\nLegacy Launcher (Minecraft)"

choice=$(echo -e "$GAMES" | rofi -dmenu \
    -theme ~/.config/rofi/applets/styles/launcher.rasi \
    -p "Play" \
    -no-show-icons \
    -markup-rows \
    -i \
    -matching fuzzy)

case "$choice" in
    "Brawlhalla") 
        steam steam://rungameid/291550 &
        ;;
    "GrandChase") 
        steam steam://rungameid/985810 &
        ;;
    "Stumble Guys") 
        steam steam://rungameid/1677740 &
        ;;
    "Legacy Launcher (Minecraft)" ) 
        java -jar $HOME/.local/share/legacy-launcher/LegacyLauncher.jar &
        ;;
esac