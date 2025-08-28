function newrepo
    if test (count $argv) -ne 1
        echo "Usage: newrepo <project-name>"
        return 1
    end

    set name $argv[1]

    # Ask for visibility
    echo -n "Make this repo public or private? [public/private]: "
    read visibility
    if test "$visibility" != "public" -a "$visibility" != "private"
        echo "Invalid choice. Please type 'public' or 'private'."
        return 1
    end

    # Create folder and initialize repo
    mkdir $name
    cd $name
    git init -b main  # start with 'main' branch

    # Create README
    echo "# $name" > README.md
    git add README.md
    git commit -m "Initial commit"

    # Create GitHub repo via SSH, add remote, and push
    gh repo create $name --$visibility --source=. --remote=origin --push

    echo "✅ Repo '$name' created locally and on GitHub ($visibility), branch set to main."
end