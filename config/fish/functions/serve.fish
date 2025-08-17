function serve
    set -l port 8000
    if test (count $argv) -gt 0
        set port "$argv[1]"
    end
    echo "Serving files from "$PWD" on port "$port"..."
    python -m http.server $port
end