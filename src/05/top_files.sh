#!/bin/bash

counter=1

find "$directory_path" -type f -exec du -b {} + | sort -rh | head -n 10 | while read -r size file; do
    file_type=$(echo "$file" | awk -F'.' '{print $NF}')
    format_name=${file_type,,}
    formatted_size=$(numfmt --to=iec --suffix=B --format="%.2f" "$size")
    echo "$counter - $file, $formatted_size, $format_name" | sed 's/\([0-9]\)\([A-Z]\)/\1 \2/g'
    counter=$((counter + 1))
done
