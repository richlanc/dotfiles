#!/bin/bash
# I implore you not to use this script. 
# Frankly, I'm stuck with it.
shopt -s dotglob

linkable_files_path="$(dirname $(realpath $0))"
for target in "$linkable_files_path"/*
do
    target_base=$(basename "$target")
    name=~

    # Skip blacklisted files/dirs
    if grep -qx "$target_base" "$linkable_files_path/blacklist"; then
        continue
    fi

    # Check for link name location file when linking a directory
    if [ -d "$target" ]; then
        if [ -e "$target/LINK_LOCATION" ]; then
            name=$(cat "$target/LINK_LOCATION")
        fi
    # Check for link name line when linking a file
    elif [ -f "$target" ]; then
        grep_name=$(grep -oP  'LINK_LOCATION:\K(.+)' $target)
        if [ -n "$grep_name" ]; then
            name=$grep_name
        fi
    fi

    # Backup existing files, link the file in the correct place
    name="$name/$target_base"
    if [ -e "$name" ] && ! [ -L "$name" ]; then
        echo "\"$name\" exists, creating backup"
        mv "$name" "$name".bak
    fi
    ln -nfs "$(realpath "$target")" "$name"
done

