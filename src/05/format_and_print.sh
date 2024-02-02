#!/bin/bash

source folder_counter.sh
find_top_folders $directory_path

source file_counter.sh

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
source top_files.sh

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
source top_executable_files.sh
