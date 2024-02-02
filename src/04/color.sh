#!/bin/bash

if [[ -f "config.cfg" ]]; then
    source config.cfg
fi

default_column1_background="4"  # Blue background
default_column1_font_color="1" # White font
default_column2_background="2" # Red background
default_column2_font_color="6" # Black font

final_column1_background_color="${column1_background:-$default_column1_background}"
final_column1_font_color="${column1_font_color:-$default_column1_font_color}"
final_column2_background_color="${column2_background:-$default_column2_background}"
final_column2_font_color="${column2_font_color:-$default_column2_font_color}"

valid_colors=("1" "2" "3" "4" "5" "6")

if [[ $final_column1_background_color == $final_column1_font_color || $final_column2_background_color == $final_column2_font_color ]]; then
    echo "Error: Font and background colors must be different for each column."
    exit 1
fi


if [[ $final_column1_background_color == $final_column1_font_color || $final_column2_background_color == $final_column2_font_color ]]; then
    echo "Error: Font and background colors must be different for each column."
    exit 1
fi


bg_colors=("47" "41" "42" "44" "45" "40")
font_colors=("37" "31" "32" "34" "35" "30")
color_names=("white" "red" "green" "blue" "purple" "black")


name_bg_color=${bg_colors[$final_column1_background_color - 1]}
name_font_color=${font_colors[$final_column1_font_color - 1]}
value_bg_color=${bg_colors[$final_column2_background_color - 1]}
value_font_color=${font_colors[$final_column2_font_color - 1]}

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
    formatted_name=$(format_text "$name" "$name_bg_color" "$name_font_color")
    formatted_value=$(format_text "$value" "$value_bg_color" "$value_font_color")
    echo "$formatted_name = $formatted_value"
done


echo -e "\n"


if [[ -z "$column1_background" ]]; then
    echo "Column 1 background = default (${color_names[$final_column1_background_color - 1]})"
else
    echo "Column 1 background = $final_column1_background_color (${color_names[$final_column1_background_color - 1]})"
fi

if [[ -z "$column1_font_color" ]]; then
    echo "Column 1 font color = default (${color_names[$final_column1_font_color - 1]})"
else
    echo "Column 1 font color = $final_column1_font_color (${color_names[$final_column1_font_color - 1]})"
fi

if [[ -z "$column2_background" ]]; then
    echo "Column 2 background = default (${color_names[$final_column2_background_color - 1]})"
else
    echo "Column 2 background = $final_column2_background_color (${color_names[$final_column2_background_color - 1]})"
fi

if [[ -z "$column2_font_color" ]]; then
    echo "Column 2 font color = default (${color_names[$final_column2_font_color - 1]})"
else
    echo "Column 2 font color = $final_column2_font_color (${color_names[$final_column2_font_color - 1]})"
fi
