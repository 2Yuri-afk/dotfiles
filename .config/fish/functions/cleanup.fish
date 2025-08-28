function cleanup
    echo "🧹 Removing orphan packages..."
    sudo pacman -Rns (pacman -Qdtq)
    echo "🧼 Clearing package cache..."
    sudo pacman -Sc --noconfirm
    echo "✅ Cleanup complete"
end