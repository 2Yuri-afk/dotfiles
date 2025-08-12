#!/bin/bash

# Nord Dotfiles Installation Script
# Automatically sets up the complete Nord theme

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
check_arch() {
    if [[ ! -f /etc/arch-release ]]; then
        print_warning "This script is designed for Arch Linux. Continue anyway? (y/N)"
        read -r response
        if [[ ! "$response" =~ ^[Yy]$ ]]; then
            exit 1
        fi
    fi
}

# Backup existing configs
backup_configs() {
    print_status "Creating backup of existing configs..."
    
    if [[ -d ~/.config ]]; then
        cp -r ~/.config ~/.config.backup.$(date +%Y%m%d_%H%M%S)
        print_success "Backup created at ~/.config.backup.$(date +%Y%m%d_%H%M%S)"
    fi
}

# Install essential packages
install_packages() {
    print_status "Installing essential packages..."
    
    # Core packages
    sudo pacman -S --needed \
        hyprland waybar kitty fish rofi swaync \
        pipewire pipewire-pulse cava \
        gtk3 gtk4 qt5ct kvantum \
        ttf-rubik ttf-fira-code \
        brightnessctl playerctl \
        grim slurp wl-clipboard \
        thunar pavucontrol \
        || print_error "Failed to install some packages"
    
    print_success "Essential packages installed"
}

# Install AUR packages (optional)
install_aur() {
    if command -v yay &> /dev/null; then
        print_status "Installing AUR packages..."
        
        yay -S --needed \
            nordic-theme \
            spicetify-cli \
            vesktop \
            || print_warning "Some AUR packages failed to install"
            
        print_success "AUR packages installed"
    else
        print_warning "yay not found. Install AUR packages manually if needed."
    fi
}

# Copy configuration files
copy_configs() {
    print_status "Copying configuration files..."
    
    # Create config directory if it doesn't exist
    mkdir -p ~/.config
    
    # Copy all configs
    cp -r config/* ~/.config/
    
    # Make scripts executable
    if [[ -d ~/.config/rofi/applets/bin ]]; then
        chmod +x ~/.config/rofi/applets/bin/*
    fi
    
    print_success "Configuration files copied"
}

# Set up themes
setup_themes() {
    print_status "Setting up themes..."
    
    # GTK theme
    if command -v gsettings &> /dev/null; then
        gsettings set org.gnome.desktop.interface gtk-theme "Nordic"
        gsettings set org.gnome.desktop.interface icon-theme "Nordic"
        gsettings set org.gnome.desktop.interface cursor-theme "Nordic"
        print_success "GTK theme applied"
    fi
    
    # Fish shell
    if command -v fish &> /dev/null; then
        print_status "Setting up Fish shell..."
        chsh -s $(which fish) || print_warning "Failed to set Fish as default shell"
        
        # Install Fisher and Tide (if fish is available)
        fish -c "curl -sL https://git.io/fisher | source && fisher install IlanCosman/tide@v5" || print_warning "Failed to install Tide prompt"
    fi
}

# Main installation function
main() {
    echo -e "${BLUE}"
    echo "🌨️  Nord Dotfiles Installation"
    echo "================================"
    echo -e "${NC}"
    
    check_arch
    
    print_status "Starting installation..."
    
    backup_configs
    install_packages
    install_aur
    copy_configs
    setup_themes
    
    echo -e "${GREEN}"
    echo "✨ Installation complete!"
    echo "========================"
    echo -e "${NC}"
    echo "🔄 Please log out and log back in to apply all changes"
    echo "🎨 Your Nord-themed setup is ready!"
    echo ""
    echo "Next steps:"
    echo "  1. Set your wallpaper in ~/.config/hypr/hyprpaper.conf"
    echo "  2. Customize keybindings in ~/.config/hypr/hyprland.conf"
    echo "  3. Enjoy your new setup! ❄️"
}

# Run main function
main "$@"