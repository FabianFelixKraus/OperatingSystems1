#!/bin/bash


# Comprova el nombre de paràmetres
if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Ús: $0 <directori> [expressió_regular]" >&2
    exit 1
fi

# Verifica si el directori existeix
if [ ! -d "$1" ]; then
    echo "Error: El directori \"$1\" no existeix o no és un directori." >&2
    exit 1
fi

directorio=$1 # Assigna el primer paràmetre com a directori
regex=$2 # Assigna el segon paràmetre com a expressió regular


subdirectorios=$(find "$directorio" -type d | sort) # Troba tots els subdirectoris dins del directori especificat i els ordena perquè surtin en el mateix ordre que l'enunciat
echo "$subdirectorios"
for subdirectorio in $subdirectorios; do # Per a cada subdirectori trobat
    cantidad_archivos=0 # Inicialitza el comptador de fitxers a 0
    if [ -z "$regex" ]; then # Si no s'ha proporcionat cap expressió regular
        cantidad_archivos=$(find "$subdirectorio" -maxdepth 1 -type f | wc -l) # Compta tots els fitxers del subdirectori
    else
        cantidad_archivos=$(find "$subdirectorio" -maxdepth 1 -type f -regex ".*$regex.*" | wc -l) # Compta els fitxers del subdirectori que compleixen amb l'expressió regular

    fi
    echo "directorio: $subdirectorio nfiles: $cantidad_archivos"
done
