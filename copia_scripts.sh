#Hacer un script llamado copia_scripts.sh, que haga un copiado de los scripts creados en la carpeta 
#pasada como parámetro, deben ser empaquetados con el comando tar y el nombre del archivo debe tener 
#el siguiente formato: “copia_scripts_ddmmaaaa.tar” siendo dd el día, mm el mes y aaaa el año en el 
#que se produce la copia.

#!/bin/bash

#Pide al menos un parámetro y si no sale del programa
if [ $# -ge 1 ]
then
    if [ -d $1 ] #Compruebo que el parametro pasado es un directorio
    then
        tar cvf copia_scripts_`date +"%d%m%Y"`.tar $1/*.sh &>/dev/null #comprimimos todos los archivos .sh del directorio introducido como parámetro con el formato en el nombre indicado
        echo "Creando el comprimido copia_scripts_`date +"%d%m%Y"`.tar en el directorio actual" #tar xvf nombre.tar para desempaquetar

    else
        echo "ERROR. El parámetro introducido debe ser un directorio válido"
        sleep 1
        exit 2
    fi

else
	echo "Debes introducir al menos un parámetro"
    sleep 1
	exit 1
fi