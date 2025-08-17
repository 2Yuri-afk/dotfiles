function mp4dl --description "Download video as MP4"
    if test (count $argv) -eq 0
        echo ""
        echo "🎬 ═══════════════════════════════════════════════════════════════"
        echo "📹 Hello, how are you today?"
        echo "🎬 ═══════════════════════════════════════════════════════════════"
        echo ""
        echo "📖 Usage: mp4dl <url> [quality] [output_dir]"
        echo "🎯 Default Quality: good (best)"
        echo "📁 Default Location: ~/Videos/Vids/"
        echo ""
        echo "💡 Examples:"
        echo "   mp4dl 'https://youtube.com/watch?v=...'        # Good quality (best)"
        echo "   mp4dl 'https://vimeo.com/...' bad              # Bad quality (worst)"
        echo "   mp4dl 'https://tiktok.com/...' good            # Explicit good"
        echo "   mp4dl 'https://youtube.com/watch?v=...' bad ~/Videos/LowQuality"
        echo ""
        echo "🎬 ═══════════════════════════════════════════════════════════════"
        return 1
    end

    set url $argv[1]
    set quality "good"  # Default to best quality
    set output_dir ~/Videos/Vids

    if test (count $argv) -ge 2
        set quality $argv[2]
    end

    if test (count $argv) -ge 3
        set output_dir $argv[3]
    end

    # Handle quality
    set format_selector ""
    switch $quality
        case good '*'
            set format_selector "b"   # Best available (video+audio)
        case bad
            set format_selector "w"   # Worst available (video+audio)
    end

    echo ""
    echo "🎬 ═══════════════════════════════════════════════════════════════"
    echo "📹 Hello, how are you today?"
    echo "🎬 ═══════════════════════════════════════════════════════════════"
    echo "🔗 URL: $url"
    echo "📁 Output: $output_dir"
    echo "🎯 Quality: $quality"
    echo "🚀 Starting download..."
    echo "🎬 ─────────────────────────────────────────────────────────────"
    echo ""

    yt-dlp -f "$format_selector" -o "$output_dir/%(title)s.%(ext)s" "$url"
end
