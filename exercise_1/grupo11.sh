#! /bin/bash

# Ana Blanco Garcia & Sofía González Piqueres
# Sistemas Operativos I
# Entrega 1 Problemas
# 22-02-2024


if [ $# -ne 1 ] #comprobamos que haya un argumento si no sale un codigo error
then
 echo "Numeros de parametros incorrectos: $0 <fitxer>"
 exit 1
fi

file=$1  # asignamos el nombre del fichero
routes=$(cat $file)  # copiamos el interior de fichero a la variable

for i in $routes # iteramos linea a linea
do 
	archive=${i%%;*} # parte del substring correspondiente al archivo
	lineNum=${i##*;} # parte del substring correspondiente al numero de lineas
	
	if [ -f $archive ]  # miramos la primera parte del archivo si existe 
 	then  
 		if [  ! -d $archive ] # si no es un directorio
	 	then
	 		echo Primeras $lineNum líneas del archivo $archive: 
	 		head -n $lineNum $archive # sacamos las lineas del archivo
		
	 	fi
	 
 
 	else  # si es un directorio y no tiene txt o si no existe el archivo sale un codigo error
		echo $archive el archivo no existe o es un directorio	
	
 	fi
 	
 	
 
done 
exit 0

