#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Nombre incorrecte de paràmetres. Ús: $0 <fitxer>"
    exit 1
fi

fitxer=$1

if [ ! -f "$fitxer" ]; then
    echo "$fitxer no existeix o és un directori."
    exit 1
fi

while IFS=';' read -r ruta_fitxer linies; do
    if [ ! -f "$ruta_fitxer" ]; then
        echo "$ruta_fitxer no existeix o és un directori."
        continue
    fi

    echo "Primeres $linies línies del fitxer $ruta_fitxer:"
    [ "$linies" -ne 0 ] && head -n "$linies" "$ruta_fitxer"
done < "$fitxer"

exit 0
