#!/bin/bash

if [[ $1 =~ [0-9] ]]; then
	echo "Invalid input: Parameter is, or contains, numbers."
elif [[ -z "$1" ]]; then
	echo "error"
elif [[ $# -gt 1 ]]; then
	echo "error"
else
	echo "Parameter value: $1"
fi
