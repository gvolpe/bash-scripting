#!/bin/bash

current_dir=$(pwd)

if [ -f "$1" ]; then
  file="$current_dir"/"$1"
  ## Removing last character from each line
  sed -i "s/.$//" "$file"
else
  echo "Invalid file name: $1"
fi
