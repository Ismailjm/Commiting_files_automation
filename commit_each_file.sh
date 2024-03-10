#!/bin/bash

# Check if the path argument is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <path_to_folder>"
    exit 1
fi

# Assign the first argument to the path variable
path="$1"

# Change directory to the specified folder
cd "$path" || exit

# Loop through each file in the folder
for file in *; do
    # Check if the item is a file (not a directory)
    if [ -f "$file" ]; then
        # Add the file to the staging area and commit it
        git add "$file"
        git commit -m "Committing $file"
    fi
done
