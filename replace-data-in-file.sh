#!/bin/bash

# Checking number of parameters
if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters. Expected 1) File name 2) String to search for 3) Replacement string."
else
    # Checking file existence
    if [ -f "$1" ]; then
	echo "File to search and replace: " $1
	echo ""

	# Creating new file
        new_file="NEW-"$1
	cp $1 $new_file

	# Search for $2 and replace for $3 in line in $new_file (using variables $2 and $3)
	sed -i "s@$2@$3@" $new_file

	# Search and replace using values
	# sed 's/value-to-search-for/replacement-value/g' $file-to-search-for >> $new_file

	# Granting execution permissions
	sudo chmod a+x $new_file
    else
	echo "Invalidad file name: $1. It doesn't exists."
    fi
fi
