#Haz un script llamado cuenta10ficheros.sh, que nos diga si en el directorio pasado como parametro hay más de 10 ficheros o no, es decir, 
#los directorios no deben ser contados.

#!/bin/bash

#Pide al menos un parámetro y si no sale del programa
if [ $# -ge 1 ]
then
    if [ -d $1 ] #Compruebo que el parametro pasado es un directorio
    then
        cont=0
        for fichero in `ls $1` #Recorro todos los elementos del directorio
        do 
            if [ -f $1/$fichero ] #Compruebo si el elemento es un fichero
            then
                let "cont++" #Aumentamos el contador de ficheros 
            fi
        done

        if [ $cont -ge 10 ] #Comprobamos si hay 10 o más ficheros 
        then
            echo "El directorio $1 contiene 10 o más ficheros"
        else
            echo "El directorio $1 contiene menos de 10 ficheros"
        fi
    else
        echo "ERROR. El parámetro introducido debe ser un directorio válido"
        sleep 2
        exit 2
    fi



else
	echo "Debes introducir al menos un parámetro"
    sleep 2
	exit 1
fi
