#!/bin/bash

function execution_time() {
    local start="$1"
    end=$(date +%s.%N)
    execution=$(printf "%.1f" "$(echo "$end - $start" | bc)")
    echo "Script execution time (in seconds) = $execution"
}
