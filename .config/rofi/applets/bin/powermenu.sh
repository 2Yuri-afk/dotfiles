# Import Current Theme
source "$HOME"/.config/rofi/applets/shared/theme.bash
theme="$type/$style"

# Theme Elements
prompt="$(cat /etc/hostname 2>/dev/null || echo 'System')"
mesg="Uptime : $(uptime -p | sed -e 's/up //g')"

# Compact layout
list_col='3'
list_row='1'

# Options
layout=$(grep 'USE_ICON' "${theme}" | cut -d'=' -f2)
if [[ "$layout" == 'NO' ]]; then
	option_1=" Lock"
	option_2=" Logout"
	option_3=" Shutdown"
	yes=' Yes'
	no=' No'
else
	option_1=""
	option_2=""
	option_3=""
	yes=''
	no=''
fi

# Rofi CMD
rofi_cmd() {
	rofi -theme-str "listview {columns: $list_col; lines: $list_row;}" \
		-theme-str 'textbox-prompt-colon {str: "";}' \
		-theme-str 'window {width: 400px;}' \
		-dmenu \
		-p "$prompt" \
		-mesg "$mesg" \
		-markup-rows \
		-theme ${theme}
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$option_1\n$option_2\n$option_3" | rofi_cmd
}

# Confirmation CMD
confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {orientation: vertical; children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you sure?' \
		-theme ${theme}
}

# Ask for confirmation
confirm_exit() {
	echo -e "$yes\n$no" | confirm_cmd
}

# Confirm and execute
confirm_run () {	
	selected="$(confirm_exit)"
	if [[ "$selected" == "$yes" ]]; then
        ${@}
    else
        exit
    fi	
}

# Execute Command
run_cmd() {
	if [[ "$1" == '--opt1' ]]; then
		if command -v betterlockscreen >/dev/null 2>&1; then
			betterlockscreen -l
		elif command -v swaylock >/dev/null 2>&1; then
			swaylock
		elif command -v hyprlock >/dev/null 2>&1; then
			hyprlock
		else
			notify-send "Lock" "No lock screen program found"
		fi
	elif [[ "$1" == '--opt2' ]]; then
		confirm_run kill -9 -1
	elif [[ "$1" == '--opt3' ]]; then
		confirm_run systemctl poweroff
	fi
}

# Actions
chosen="$(run_rofi)"
case ${chosen} in
    $option_1) run_cmd --opt1 ;;
    $option_2) run_cmd --opt2 ;;
    $option_3) run_cmd --opt3 ;;
esac
