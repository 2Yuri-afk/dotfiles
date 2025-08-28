function gopush
    if not test -d .git
        echo "❌ Not in a git repo"
        return 1
    end
    set msg $argv[1]
    if test -z "$msg"
        set msg "Update"
    end
    git add .
    git commit -m "$msg"
    git push
    echo "✅ Changes pushed"
end