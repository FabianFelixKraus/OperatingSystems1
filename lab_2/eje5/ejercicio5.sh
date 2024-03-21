#!/bin/bash

# Moves a given file to a directory depending on its extension
function move_file() {
  file="$1"
  extension="${file##*.}"
  base_directory="$2"

  if [ ! -f "$extension" ]; then
    # Create a new directory if it does not exit already
    mkdir -p "$base_directory/$extension"
  fi

  # Move the file to the directory
  mv "$file" "$base_directory/$extension"
}

# Store the name of the new directory that will include the organized files
directory="$1"

# Loop through the files 
for file in *; do
  # check if it is a file
  if [ -f "$file" ]; then
    # Move the files into their respective directory
    move_file "$file" "$directory"
  fi
done

echo "Archivos clasificados correctamente"

# Show the changes made by the script
tree

