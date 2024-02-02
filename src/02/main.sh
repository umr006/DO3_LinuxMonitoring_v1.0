#!/bin/bash

source print.sh

print

read -p "Would you like to save data into the file [Y/N]" answer

if [[ %answer == "Y" ]] || [[ $answer == "y" ]]; then
	print > $(date +"%d_%m_%Y_%H_%M_%S").status
else
	exit 1
fi
