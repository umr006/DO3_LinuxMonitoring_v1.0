#!/bin/bash

counter=1

find "$directory_path" -type f -executable -exec du -b {} + | sort -rh | head -n 10 | while read -r size file; do
    md5_hash=$(md5sum "$file" | awk '{print $1}')
    formatted_size=$(numfmt --to=iec --suffix=B --format="%.2f" "$size")
    echo "$counter - $file, $formatted_size, $md5_hash" | sed 's/\([0-9]\)\([A-Z]\)/\1 \2/g'
    counter=$((counter + 1))
done
