#!/bin/bash

current_dir=$(pwd)

## Search for all CSV files in the current directory
for file in "$current_dir"/*.csv
do
  if [ -f "$file" ]; then
    ## Get the basename without the path
    filename=${file##*/} 
    echo "Processing File: $filename"
    new_file="$current_dir"/processed_files/"$filename"

    ## Delete the first line (AKA the header) and generate a new file.
    tail -n +2 $file >> $new_file
    echo "Generated New File: $new_file"
  fi
done

