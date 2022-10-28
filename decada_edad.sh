#Haz un script llamado decada_edad.sh, que dada una edad que introducimos por pantalla, nos diga como resultado la década en la que nacimos 
#(ejemplo 70, 80, 90 …). Suponemos que la edad introducida está entre 15 y 60 años. El script debe coger el año actual de forma automática. 
#La salida debe producirse en el siguiente formato: “Si naciste en 1983, naciste en la decada de 1980”.

#!/bin/bash
es_numero='^[0-9]+$'
#Pide al menos un parámetro y si no sale del programa
if [ $# -le 0 ]
then
	echo "Debes introducir al menos un parámetro"
	exit 1
fi
#Si el parámetro introducido no es un número entero, sale del programa
if ! [[ $1 =~ $es_numero ]] ; then
   echo "El parámetro debe ser un número entero" 
   exit 2
fi
#Si el parámetro introducido es un número, comprueba que esté entre el 15 y el 60
if ! [[ $1 -ge 15 && $1 -le 60 ]] ; then 

    echo "El parámetro debe estar comprendido entre 15 y 60"
    exit 3
fi
#Si se cumplen todas las condiciones anteriores, el programa llega hasta aquí y ya compara según el rango de edad.
anio=$(date +%Y) #obtiene el número del año actual
nacimiento=$(($anio - $1)) #resta el año actual más la edad que tienes para saber en qué año naciste.
if [[ $nacimiento -ge 2000 && $nacimiento -le $anio ]] ; then

    echo "Si naciste en $nacimiento, naciste en la década de los 2000"
    exit
fi

if [[ $nacimiento -ge 1990 && $nacimiento -le 1999 ]] ; then

    echo "Si naciste en $nacimiento, naciste en la década de los 90"
    exit
fi
if [[ $nacimiento -ge 1980 && $nacimiento -le 1989 ]] ; then

    echo "Si naciste en $nacimiento, naciste en la década de los 80"
    exit
fi
if [[ $nacimiento -ge 1970 && $nacimiento -le 1979 ]] ; then

    echo "Si naciste en $nacimiento, naciste en la década de los 70"
    exit
fi
if [[ $nacimiento -ge 1960 && $nacimiento -le 1969 ]] ; then

    echo "Si naciste en $nacimiento, naciste en la década de los 60"
    exit
fi
