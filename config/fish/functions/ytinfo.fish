function ytinfo --description "Show video information"
    if test (count $argv) -eq 0
        echo "ℹ️  Show Video Information"
        echo "Usage: ytinfo <url>"
        echo "Example: ytinfo 'https://youtube.com/watch?v=...'"
        return 1
    end
    
    set url $argv[1]
    echo "ℹ️  Getting video information:"
    echo ""
    
    yt-dlp -j "$url" | jq -r '
        "Title: " + .title,
        "Duration: " + (.duration | tostring) + " seconds",
        "Uploader: " + .uploader,
        "View Count: " + (.view_count | tostring),
        "Upload Date: " + .upload_date
    '
end