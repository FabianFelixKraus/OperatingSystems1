#!/bin/bash

# Check if number of arguments is correct
if [ "$#" -ne 1 ]; then
	echo "Se requiere el siguiente formato: ./ejercicio4.sh <cadena>"
	exit 1
fi

cadena="$1"

# Check if entered string is a number using regular expressions 
if [[ "$cadena" =~ ^[0-9]+$ ]]; then
	echo "La cadena es un número"
	exit 0
fi

# Get the length of the string
length=${#cadena}

uppercaseString="${cadena^^}"

# Print the length and the uppercase string
echo "Longitud de la cadena: $length"
echo "Cadena en mayúsculas: $uppercaseString"

