function batchdl --description "Batch download from file"
    if test (count $argv) -eq 0
        echo "📦 Batch Downloader"
        echo "Usage: batchdl <file> [format]"
        echo "Example: batchdl urls.txt mp3"
        return 1
    end
    
    set file $argv[1]
    set format "mp4"
    if test (count $argv) -ge 2
        set format $argv[2]
    end
    
    python3 "$HOME/.local/lib/cli-downloader/main.py" batch "$file" --format "$format"
end
