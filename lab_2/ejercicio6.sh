#!/bin/bash

# Check if the number of arguments given is correct
if [ "$#" -ne 3 ]; then
	echo "Se requiere el siguiente formato: ./ejercicio6.sh <directorio> <cadena_busqueda> <cadena_reemplazo>"
	exit 1
fi

directory="$1"
search_string="$2"
replace_string="$3"

# Check if the first argument (directory) exists
if [ ! -d "$directory" ]; then
	echo "El directorio '$directory' no existe."
	exit 2
fi

# Loop through all files in the directory
for filename in "$directory/"*; do
  # Check if filename is a regular file
  if [[ -f "$filename" ]]; then
    # Create the new filename with replacing the string
    new_filename="${filename//${search_string}/${replace_string}}"
    
    # Rename the file using mv
    mv "$filename" "$new_filename"
  fi
done

echo "Búsqueda y reemplazo completados."
