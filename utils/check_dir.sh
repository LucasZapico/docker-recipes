#!/bin/bash

# Check if a directory path is passed as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Assign the first argument to dir_to_check
dir_to_check="$1"

# Maximum number of retries
max_retries=5

# Time to wait between retries (in seconds)
retry_interval=10

# Current retry count
retry_count=0

# Function to check if directory exists
check_dir() {
  if [ -d "$dir_to_check" ]; then
    echo "Directory $dir_to_check has been successfully mounted."
    exit 0
  else
    echo "Directory $dir_to_check not found. Attempt $retry_count of $max_retries."
    retry_count=$((retry_count+1))
    
    if [ $retry_count -gt $max_retries ]; then
      echo "Failed to find directory $dir_to_check after $max_retries attempts."
      exit 1
    else
      sleep $retry_interval
    fi
  fi
}

# Main loop
while [ $retry_count -le $max_retries ]; do
  check_dir
done