if status is-interactive
    # Commands to run in interactive sessions can go here
end
set fish_greeting ""

# GTK Theme configuration
set -gx GTK_THEME Nordic
set -gx GTK2_RC_FILES "$HOME/.themes/Nordic/gtk-2.0/gtkrc"

set -gx TERMINAL kitty

fish_add_path /home/yuri/.spicetify
