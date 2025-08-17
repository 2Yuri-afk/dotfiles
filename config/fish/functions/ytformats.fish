function ytformats --description "Show available formats for a video"
    if test (count $argv) -eq 0
        echo "📋 Show Available Video Formats"
        echo "Usage: ytformats <url>"
        echo "Example: ytformats 'https://youtube.com/watch?v=...'"
        return 1
    end
    
    set url $argv[1]
    echo "🔍 Checking available formats for:"
    echo "$url"
    echo ""
    
    yt-dlp -F "$url"
end