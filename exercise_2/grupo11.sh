#! /bin/bash

if [ $# -ge 1 ] 
then

	file=file.txt
	if [ -d $1 ] # Comprobamos que sea un directorio 
	then
 
		for directorio in $(find $1 -type d) # Bucle en el cual buscamos dentro de los directorios
	 	do 	
	 	
	 		ls $directorio > $file # Asignamos la busqueda de directorios a un file
	 		
	 		if [ $# -eq 2 ]
	 		then 
	 		
	 			echo $directorio nfile:$(grep -E "$2" $file | wc -l) # Si entran un regex buscamos en funcio a este dentro del fichero
	 		else
	 		
	 			echo $directorio nfile: $(ls $directorio | wc -l) # Si no mostramos solo por nombre del directorio
	 		fi
	 		
	 	done
	 
	 	exit 0

	else 
		echo "El argumento no es un directorio"
		exit 1
	fi
 
else # Comprobamos que haya un argumento si no sale un codigo error
	echo "Numeros de parametros incorrectos"
	exit 2
fi




