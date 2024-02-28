#!/bin/bash

# Check if one argument has been provided
if [ "$#" -ne 1 ]; then
  echo "Se requiere un número entero como argumento."
  echo "Formato: ./ejercicio3.sh <numero>"
  exit 1
fi

# Check if the argument is an integer with regex
if ! [[ "$1" =~ ^[0-9]+$ ]]; then
  echo "El argumento debe ser un número entero."
  exit 2
fi

# Get the number from the argument
number="$1"

# Iterate from 1 to 10
for i in $(seq 1 10); do

  # Calculate the product of the number and the current iterator
  product=$((number * i))

  # Print the multiplication result
  echo "$number x $i = $product"
done

exit 0
