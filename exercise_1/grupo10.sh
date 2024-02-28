#!/bin/bash

# Check if 1 argmuent is given
if [ "$#" -ne 1 ]; then
	echo "Error: Please provide exactly 1 argmuent."
	exit 1
fi

# Store the given filename
FILENAME="$1"

# Check if the the file with FILENAME exists
if [ ! -e "$FILENAME" ]; then
	echo "Error: The file '$FILENAME' does not exist."
	exit 2
fi

# Initialize an error flag
CAUGHTERROR=false

# Read the given file and process each line
while read -r line; do
	# Set the splitted values to FILE and NUMBER
	IFS=';' read -r FILE NUMBER <<< "$line"
	
	# Check if the file in list1.txt exists and is a regular file
	if [ ! -f "$FILE" ]; then
    		echo "Error: '$FILE' mentioned in list1.txt is not a regular file. It might be a directory or does not exist"
    		CAUGHTERROR=true
		continue
	fi

	echo "$FILE"

	# Print first N lines if given NUMBER is greater than 0
	if [ "$NUMBER" -gt 0 ]; then
		head -n "$NUMBER" "$FILE"
	else
		echo "Error: Number of lines to print should be greater than 0."
		CAUGHTERROR=true
		continue
	fi

	# Print a new line to increase readability
	echo

done < "$FILENAME"

# Check if any errors were encountered
if [ "$CAUGHTERROR" = true ]; then
	echo "Script encountered errors."
	exit 3
else
	echo "Script completed successfully."
	exit 0
fi

