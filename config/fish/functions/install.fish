function install
    if test (count $argv) -eq 0
        echo "Usage: install <package_name>..."
        return 1
    end
    echo "📦 Installing packages: "$argv
    sudo pacman -S $argv
end