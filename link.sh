#!/bin/bash
shopt -s dotglob

script_dir="$(dirname $(realpath $0))"
for dir_content in "$script_dir"/*
do
    file=$(basename "$dir_content")
    location=~
    if ! grep -qx "$file" "$script_dir/blacklist"
    then
        if [ -d "$dir_content" ]
        then
            if [ -e "$dir_content/LINK_LOCATION" ]
            then
                location=$(cat "$dir_content/LINK_LOCATION")
            fi
        elif [ -f "$dir_content" ]
        then
            grep_location=$(grep -oP  'LINK_LOCATION:\K(.+)' $dir_content)
            if ! [ -z "$grep_location" ]
            then
                location=$grep_location
            fi
        fi

        ln -nfs "$(realpath "$dir_content")" "$location/$file"
    fi
done

