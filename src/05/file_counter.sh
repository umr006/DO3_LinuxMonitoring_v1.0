#!/bin/bash

function count_files() {
    local dir="$1"
    local count=0

    for entry in "$dir"/*; do
        if [[ -f "$entry" ]]; then
            count=$((count + 1))
        elif [[ -d "$entry" ]]; then
            count=$((count + $(count_files "$entry")))
        fi
    done

    echo "$count"
}
total_files=$(count_files "$directory_path")
echo "Total number of files = $total_files"


echo "Number of:"

function count_config_files() {
    local dir="$1"
    local count=0

    for entry in "$dir"/*.conf; do
        if [[ -f "$entry" ]]; then
            count=$((count + 1))
        fi
    done

    echo "$count"
}
total_config_files=$(count_config_files "$directory_path")
echo "Configuration files (with the .conf extension) = $total_config_files"


function count_text_files() {
    local dir="$1"
    local count=0

    for entry in "$dir"/*; do
        if [[ -f "$entry" && "$entry" == *.txt ]]; then
            count=$((count + 1))
        elif [[ -d "$entry" ]]; then
            count=$((count + $(count_text_files "$entry")))
        fi
    done

    echo "$count"
}
total_text_files=$(count_text_files "$directory_path")
echo "Text files = $total_text_files"


function count_executable_files() {
    local dir="$1"
    local count=0

    for entry in "$dir"/*; do
        if [[ -f "$entry" && -x "$entry" ]]; then
            count=$((count + 1))
        elif [[ -d "$entry" ]]; then
            count=$((count + $(count_executable_files "$entry")))
        fi
    done

    echo "$count"
}
total_executable_files=$(count_executable_files "$directory_path")
echo "Executable files = $total_executable_files"


function count_executable_files() {
    local dir="$1"
    local count=0

    for entry in "$dir"/*; do
        if [[ -f "$entry" && -x "$entry" ]]; then
            count=$((count + 1))
        elif [[ -d "$entry" ]]; then
            count=$((count + $(count_executable_files "$entry")))
        fi
    done

    echo "$count"
}
total_executable_files=$(count_executable_files "$directory_path")
echo "Executable files = $total_executable_files"


function count_log_files() {
    local dir="$1"
    local count=0

    for entry in "$dir"/*; do
        if [[ -f "$entry" && "$entry" == *.log ]]; then
            count=$((count + 1))
        elif [[ -d "$entry" ]]; then
            count=$((count + $(count_log_files "$entry")))
        fi
    done

    echo "$count"
}
total_log_files=$(count_log_files "$directory_path")
echo "Log files (with the .log extension) = $total_log_files"


function count_archive_files() {
    local dir="$1"
    local count=0

    for entry in "$dir"/*; do
        if [[ -f "$entry" && ( "$entry" == *.zip || "$entry" == *.tar || "$entry" == *.gz ) ]]; then
            count=$((count + 1))
        elif [[ -d "$entry" ]]; then
            count=$((count + $(count_archive_files "$entry")))
        fi
    done

    echo "$count"
}
total_archive_files=$(count_archive_files "$directory_path")
echo "Archive files = $total_archive_files"


function count_symbolic_links() {
    local dir="$1"
    local count=0

    for entry in "$dir"/*; do
        if [[ -L "$entry" ]]; then
            count=$((count + 1))
        elif [[ -d "$entry" ]]; then
            count=$((count + $(count_symbolic_links "$entry")))
        fi
    done

    echo "$count"
}
total_symbolic_links=$(count_symbolic_links "$directory_path")
echo "Symbolic links = $total_symbolic_links"
