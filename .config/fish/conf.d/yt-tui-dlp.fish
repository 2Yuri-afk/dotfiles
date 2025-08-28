# yt-tui-dlp configuration

# Add cargo and local bin to PATH if not already present
if not contains $HOME/.cargo/bin $PATH
    set -gx PATH $HOME/.cargo/bin $PATH
end

if not contains $HOME/.local/bin $PATH
    set -gx PATH $HOME/.local/bin $PATH
end

# Aliases for yt-tui-dlp
alias ytdl='yt-tui-dlp'
alias ytui='yt-tui-dlp'
alias yttui='yt-tui-dlp'

# Function to download with yt-tui-dlp directly from command line
function ytget
    if test (count $argv) -eq 0
        echo "Usage: ytget <URL>"
        echo "Opens yt-tui-dlp with the URL pre-loaded"
        return 1
    end
    
    # Create a temporary file with the URL
    set tmpfile (mktemp /tmp/ytui-url.XXXXXX)
    echo $argv[1] > $tmpfile
    
    # Start yt-tui-dlp
    yt-tui-dlp
    
    # Clean up
    rm -f $tmpfile
end

# Completion for ytget
complete -c ytget -d "Download video/playlist with yt-tui-dlp"

# Add a helpful function to check if yt-dlp is installed
function ytcheck
    echo "Checking yt-tui-dlp dependencies..."
    
    if command -v yt-dlp > /dev/null
        echo "✓ yt-dlp is installed: "(which yt-dlp)
    else
        echo "✗ yt-dlp is NOT installed"
        echo "  Install with: sudo pacman -S yt-dlp"
    end
    
    if command -v yt-tui-dlp > /dev/null
        echo "✓ yt-tui-dlp is installed: "(which yt-tui-dlp)
    else
        echo "✗ yt-tui-dlp is NOT in PATH"
        echo "  Run the installation script: ./install.sh"
    end
end

