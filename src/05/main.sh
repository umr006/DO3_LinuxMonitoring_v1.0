#!/bin/bash

if [[ $# -ne 1 || ! "$1" == */ ]]; then
    echo "Usage: $0 /path/to/your/directory/"
    exit 1
fi


directory_path="$1"


start=$(date +%s.%N)
source format_and_print.sh
source execution_time.sh
execution_time $start
