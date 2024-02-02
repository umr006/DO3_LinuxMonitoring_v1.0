#!/bin/bash

function count_folders() {
    local dir="$1"
    local count=0

    shopt -s dotglob

    for entry in "$dir"/*; do
        if [[ -d "$entry" ]]; then
            count=$((count + 1))
            count=$((count + $(count_folders "$entry")))
        fi
    done

    shopt -u dotglob

    echo "$count"
}
total_folders=$(count_folders $directory_path)
echo "Total number of folders (including all nested ones) = $total_folders"

echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
function find_top_folders() {
    local dir="$1"
    declare -A folder_sizes=()

    shopt -s dotglob

    for entry in "$dir"/*; do
        if [[ -d "$entry" ]]; then
            size=$(du -sb "$entry" | awk '{print $1}')
            folder_sizes["$entry"]=$size
        fi
    done

    shopt -u dotglob

    IFS=$'\n' sorted_sizes=($(sort -nr <<<"${folder_sizes[*]}"))
    unset IFS

    for ((i = 0; i < 5 && i < ${#sorted_sizes[@]}; i++)); do
        size=${sorted_sizes[i]}
        folder_path=""
        for key in "${!folder_sizes[@]}"; do
            if [[ "${folder_sizes[$key]}" == "$size" ]]; then
                folder_path="$key"
                unset "folder_sizes[$key]"
                break
            fi
        done

        size_formatted=$(numfmt --to=iec --suffix=B --format="%.2f" $size)
        echo "$((i + 1)) - $folder_path, $size_formatted" | sed 's/\([0-9]\)\([A-Z]\)/\1 \2/g'
    done
}
