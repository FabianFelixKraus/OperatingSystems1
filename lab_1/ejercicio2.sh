#!/bin/bash

# Check if two arguments have been provided
if [ "$#" -ne 2 ]; then
    echo "Se requiere el siguiente formato: ./ejercicio2.sh <archivo> <permisos_octales>"
    exit 1
fi

# Check if the file exists
file="$1"
if [ ! -e "$file" ]; then
    echo "El archivo no existe."
    exit 2
fi

# Check if permission-code is valid using regular expressions
permission_code="$2"
if ! [[ "$permission_code" =~ ^[0-7]{3}$ ]]; then
    echo "Los permisos deben ser un código numérico (octal) de tres dígitos."
    exit 3
fi

# Print current file permissions
echo "Permisos actuales de $file: $(stat -c %a "$file")"


# Update file permissions using individual permissions
chmod +"$permission_code" "$file"

# Print updated file permissions
echo "Nuevos permisos de $file: $(stat -c %a "$file")"


exit 0
