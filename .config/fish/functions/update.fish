function update
    echo "📦 Updating system..."
    sudo pacman -Syu --noconfirm
    if type -q paru
        echo "📦 Updating AUR packages..."
        paru -Syu --noconfirm
    end
    echo "✅ All packages updated"
end