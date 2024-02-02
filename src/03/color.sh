#!/bin/bash


valid_colors=("1" "2" "3" "4" "5" "6")

if [[ ! " ${valid_colors[@]} " =~ " $1 " || ! " ${valid_colors[@]} " =~ " $2 " || ! " ${valid_colors[@]} " =~ " $3 " || ! " ${valid_colors[@]} " =~ " $4 " ]]; then
    echo "Invalid color codes provided. Please provide valid color codes (1-6) for all parameters."
    exit 1
fi

if [[ $1 == $2 || $3 == $4 ]]; then
    echo "Error: Font and background colors must be different for each column."
    exit 1
fi

bg_colors=("47" "41" "42" "44" "45" "40")
font_colors=("37" "31" "32" "34" "35" "30")

bg_name_color=${bg_colors[$1 - 1]}
font_name_color=${font_colors[$2 - 1]}
bg_value_color=${bg_colors[$3 - 1]}
font_value_color=${font_colors[$4 - 1]}

function format_text() {
    local text="$1"
    local bg_color="$2"
    local font_color="$3"
    echo -e "\e[${bg_color};${font_color}m${text}\e[0m"
}

source data.sh

for line in "${data[@]}"; do
    name=${line%%=*}
    value=${line#*=}
    formatted_name=$(format_text "$name" "$bg_name_color" "$font_name_color")
    formatted_value=$(format_text "$value" "$bg_value_color" "$font_value_color")
    echo "$formatted_name = $formatted_value"
done
