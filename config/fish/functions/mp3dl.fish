function mp3dl --description "Download audio as MP3"
    if test (count $argv) -eq 0
        echo ""
        echo "🎵 ═══════════════════════════════════════════════════════════════"
        echo "🎧 Hello, how are you today?"
        echo "🎵 ═══════════════════════════════════════════════════════════════"
        echo ""
        echo "📖 Usage: mp3dl <url> [quality] [output_dir]"
        echo "🎯 Default Quality: mid (192kbps)"
        echo "📁 Default Location: ~/Music/"
        echo ""
        echo "💡 Examples:"
        echo "   mp3dl 'https://youtube.com/watch?v=...'           # Mid quality (192kbps, default)"
        echo "   mp3dl 'https://youtube.com/watch?v=...' good      # Best quality"
        echo "   mp3dl 'https://youtube.com/watch?v=...' bad       # Low quality (128kbps)"
        echo "   mp3dl 'https://youtube.com/watch?v=...' mid ~/Music/Rock"
        echo ""
        echo "🎵 ═══════════════════════════════════════════════════════════════"
        return 1
    end
    
    set url $argv[1]
    set quality "192"  # Default to mid quality
    set output_dir ~/Music
    
    if test (count $argv) -ge 2
        set quality $argv[2]
    end
    
    if test (count $argv) -ge 3
        set output_dir $argv[3]
    end
    
    # Handle quality keywords
    set audio_quality ""
    if test "$quality" = "mid"
        set audio_quality "192"
    else if test "$quality" = "good"
        set audio_quality "best"
    else if test "$quality" = "bad"
        set audio_quality "128"
    else
        # Use the quality as-is (could be a number like 320)
        set audio_quality "$quality"
    end
    
    echo ""
    echo "🎵 ═══════════════════════════════════════════════════════════════"
    echo "🎧 Hello, how are you today?"
    echo "🎵 ═══════════════════════════════════════════════════════════════"
    echo "🔗 URL: $url"
    echo "📁 Output: $output_dir"
    echo "🎯 Quality: $quality"
    echo "🚀 Starting download..."
    echo "🎵 ─────────────────────────────────────────────────────────────"
    echo ""
    
    yt-dlp -f "bestaudio/best" -x --audio-format mp3 --audio-quality "$audio_quality" -o "$output_dir/%(title)s.%(ext)s" "$url" --no-check-formats
end
