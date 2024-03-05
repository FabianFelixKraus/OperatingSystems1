#!/bin/bash

# Set the regular expression to be empty
regex=""

# Check number of arguments
if [ "$#" -eq 1 ]; then
	directory="$1"
elif [ "$#" -eq 2 ]; then
	directory="$1"
	regex="$2"
else
	echo "Error: Wrong number of arguments one or two are allowed!"
	exit 1
fi

# Check if first argument is an existing directory
if [ ! -d "$directory" ]; then
	echo "Error: Specified directory "$directory" does not exist!"
fi

# Function to count files in a directory
count_files() {
	local dir="$1"
	local file_count=$(find "$dir" -maxdepth 1 -type f -regex "$regex" | wc -l)
	echo "directorio: "$dir" nfiles: $file_count"
}

# Count files in the specified directory
count_files "$directory"

# Loop through subdirectories and count files
while IFS= read -r -d '' sub_dir; do
	count_files "$sub_dir"
done < <(find "$directory" -type d -print0)

exit 0
