# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt='Screenshot'
mesg="DIR: $HOME/Pictures/Screenshots"

# Compact layout like network applet
list_col='3'
list_row='1'
win_width='400px'

# Options
layout=`cat ${theme} | grep 'USE_ICON' | cut -d'=' -f2`
if [[ "$layout" == 'NO' ]]; then
	option_1=" Capture Desktop"
	option_2=" Capture Area"
	option_3=" Capture Window"
else
	option_1=""
	option_2=""
	option_3=""
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "window {width: $win_width;}" \
		-theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\\n$option_2\\n$option_3" | rofi_cmd
}

# Screenshot
time=`date +%Y-%m-%d-%H-%M-%S`
if command -v hyprctl >/dev/null 2>&1 && hyprctl monitors -j >/dev/null 2>&1; then
    geometry="$(hyprctl monitors -j | jq -r '.[0].width')x$(hyprctl monitors -j | jq -r '.[0].height')"
else
    geometry="1920x1080"  # fallback resolution
fi
dir="$HOME/Pictures/Screenshots"
file="Screenshot_${time}_${geometry}.png"

if [[ ! -d "$dir" ]]; then
	mkdir -p "$dir"
fi

# notify and view screenshot
notify_view() {
	if command -v notify-send >/dev/null 2>&1; then
		notify_cmd_shot='notify-send -u normal -t 3000'
	elif command -v dunstify >/dev/null 2>&1; then
		notify_cmd_shot='dunstify -u low --replace=699'
	else
		notify_cmd_shot='echo'
	fi
	
	if [[ -e "$dir/$file" ]]; then
		${notify_cmd_shot} "Screenshot Saved" "Saved to $dir/$file"
		# Try to open with available image viewer
		if command -v eog >/dev/null 2>&1; then
			eog "${dir}/$file" &
		elif command -v viewnior >/dev/null 2>&1; then
			viewnior "${dir}/$file" &
		elif command -v feh >/dev/null 2>&1; then
			feh "${dir}/$file" &
		fi
	else
		${notify_cmd_shot} "Screenshot Failed" "Could not save screenshot"
	fi
}

# Copy screenshot to clipboard
copy_shot () {
	tee "$file" | wl-copy --type image/png
}

# take shots
shotnow () {
	cd ${dir} && sleep 3 && grim "$file"
	if command -v wl-copy >/dev/null 2>&1; then
		wl-copy --type image/png < "$file"
	fi
	notify_view
}

shotwin () {
	cd ${dir}
	# Add a 1 second delay to allow rofi applet to disappear
	sleep 1
	if command -v hyprctl >/dev/null 2>&1 && hyprctl activewindow -j >/dev/null 2>&1; then
		grim -g "$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')" "$file"
	else
		# Fallback to full screen if hyprctl not available
		grim "$file"
	fi
	if command -v wl-copy >/dev/null 2>&1; then
		wl-copy --type image/png < "$file"
	fi
	notify_view
}

shotarea () {
	cd ${dir} && grim -t png -g "$(slurp)" - > "$file"
	if command -v wl-copy >/dev/null 2>&1; then
		wl-copy --type image/png < "$file"
	fi
	notify_view
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		shotnow
	elif [[ "$1" == '--opt2' ]]; then
		shotarea
	elif [[ "$1" == '--opt3' ]]; then
		shotwin
	fi
}

# Actions
chosen="$(run_rofi)"

# Exit if nothing was chosen (ESC pressed or clicked away)
if [[ -z "$chosen" ]]; then
    exit 0
fi

case ${chosen} in
    $option_1)
		run_cmd --opt1
        ;;
    $option_2)
		run_cmd --opt2
        ;;
    $option_3)
		run_cmd --opt3
        ;;
esac


