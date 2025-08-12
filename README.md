# 🌨️ Nord Dotfiles

> *A clean, minimal Arch Linux setup with Hyprland and Nord theme*

![Hyprland](https://img.shields.io/badge/WM-Hyprland-blue?style=flat-square&logo=wayland)
![Arch](https://img.shields.io/badge/OS-Arch%20Linux-blue?style=flat-square&logo=archlinux)
![Nord](https://img.shields.io/badge/Theme-Nord-lightblue?style=flat-square)

## 🖼️ Preview

*Add your screenshots here*

## ⚡ Quick Setup

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

## 🎨 Theme Details

- **Color Scheme**: [Nord](https://nordtheme.com) - Polar night meets aurora
- **Window Manager**: Hyprland with smooth animations
- **Status Bar**: Waybar with custom Nord styling  
- **Notifications**: SwayNC with matching theme
- **Terminal**: Kitty with Nord colors
- **Shell**: Fish with Tide prompt
- **App Launcher**: Rofi with custom Nord theme

## 📦 What's Included

### Core Components
- **Hyprland** - Wayland compositor config
- **Waybar** - Status bar with Nord theme
- **SwayNC** - Notification center
- **Rofi** - Application launcher & scripts
- **Kitty** - Terminal emulator
- **Fish** - Shell with custom config

### Theming
- **GTK 3/4** - Nord theme integration
- **Qt5** - Matching Qt theming
- **Kvantum** - Advanced Qt styling
- **Cava** - Audio visualizer with Nord gradient

### Extras
- **Btop** - System monitor
- **Fastfetch** - System info
- **Spicetify** - Spotify theming
- **Vesktop** - Discord theming

## 🛠️ Dependencies

### Essential
```bash
# Core packages
sudo pacman -S hyprland waybar kitty fish rofi swaync

# Audio & media
sudo pacman -S pipewire pipewire-pulse cava

# Theming
sudo pacman -S gtk3 gtk4 qt5ct kvantum
```

### Optional
```bash
# System monitoring
sudo pacman -S btop fastfetch

# Media
yay -S spicetify-cli vesktop
```

## 🎯 Key Features

- **🌊 Smooth Animations** - Hyprland with optimized bezier curves
- **🎨 Consistent Theming** - Nord colors across all applications  
- **⚡ Fast Workflow** - Rofi scripts for common tasks
- **🔊 Audio Visualization** - Cava with Nord gradient
- **📱 Modern UI** - Clean, minimal interface design
- **🌙 Dark Theme** - Easy on the eyes for long sessions

## 🚀 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Backup existing configs** (optional but recommended)
   ```bash
   cp -r ~/.config ~/.config.backup
   ```

3. **Install dependencies**
   ```bash
   # Install from the dependency list above
   ```

4. **Copy configurations**
   ```bash
   cp -r config/* ~/.config/
   ```

5. **Set up themes**
   ```bash
   # Install Nord GTK theme
   yay -S nordic-theme
   
   # Apply theme
   gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
   ```

## ⌨️ Keybindings

| Key Combination | Action |
|---|---|
| `Super + Return` | Open terminal |
| `Super + D` | App launcher |
| `Super + Shift + D` | Scripts menu |
| `Super + Q` | Close window |
| `Super + M` | Exit Hyprland |
| `Super + V` | Toggle floating |
| `Super + P` | Power menu |
| `Super + Shift + S` | Screenshot |

## 🎨 Customization

### Colors
All colors are defined in `config/hypr/colors.conf`. Modify this file to change the entire theme:

```css
$primary = rgb(88c0d0)    # Nord frost blue
$secondary = rgb(81a1c1)  # Nord blue
$accent = rgb(8fbcbb)     # Nord teal
```

### Waybar Modules
Edit `config/waybar/config` to add/remove modules:

```json
"modules-right": [
  "tray",
  "pulseaudio", 
  "memory",
  "network",
  "clock"
]
```

## 📁 File Structure

```
dotfiles/
├── config/
│   ├── hypr/           # Hyprland configuration
│   ├── waybar/         # Status bar
│   ├── swaync/         # Notifications  
│   ├── rofi/           # App launcher
│   ├── kitty/          # Terminal
│   ├── fish/           # Shell
│   └── ...
├── scripts/            # Utility scripts
├── assets/             # Screenshots, wallpapers
└── README.md
```

## 🤝 Contributing

Feel free to fork and customize! If you make improvements, PRs are welcome.

## 📸 Gallery

*Add more screenshots showcasing different aspects*

## 💝 Credits

- [Nord Theme](https://nordtheme.com) - Beautiful color palette
- [Hyprland](https://hypr.land) - Amazing Wayland compositor
- [r/unixporn](https://reddit.com/r/unixporn) - Inspiration and community

---

<div align="center">

**⭐ Star this repo if you found it useful!**

Made with ❄️ and ☕ on Arch Linux

</div>