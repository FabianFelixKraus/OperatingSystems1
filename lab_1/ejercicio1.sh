#!/bin/bash

# Check number of arguments
if [ "$#" -ne 2 ]; then 
	echo "Se requiere el siguiente formato: ./ejercicio1.sh <archivo1> <archivo2>"
	exit 1
fi


# Assign files to variables
file1="$1"
file2="$2"
result="concatenados.txt"


# Check if files exist
if [ ! -e "$file1" ] || [ ! -f "$file2" ]; then
	echo "Al menos uno de los archivos no existe."
	exit 2
fi


# Calculate the storage of the files
size_file1=$(wc -c < "$file1")
size_file2=$(wc -c < "$file2")


# Concatenate files
cat "$file1" "$file2" > "$result"

# Calculate the storage of the result file
size_result=$(wc -c "$result")


# Print results
echo "Tamaño del archivo "$file1": "$size_file1""
echo "Tamaño del archivo "$file2": "$size_file2""
echo "Tamaño del archivo "$result": "$size_result""

