function uninstall
    if test (count $argv) -eq 0
        echo "Usage: uninstall <package_name>..."
        return 1
    end
    echo "📦 Uninstalling packages: "$argv
    sudo pacman -Rns $argv
end