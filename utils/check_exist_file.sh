#!/bin/bash

# Check if a file path is passed as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

# Assign the first argument to file_path
file_path="$1"

# Check if the file exists
if [ -f "$file_path" ]; then
    echo "File $file_path exists."
else
    echo "File $file_path does not exist."
fi