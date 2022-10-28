#Haz un script llamado horoscopochino.sh, que pida el año en que nacimos (4 cifras) y nos diga por pantalla qué animal nos corresponden 
#según el horóscopo chino. Para calcularlo debemos dividir el año entre 12 y el resto nos indicará el animal según la siguiente tabla:

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

anio=$(date +%Y)
#Si el parámetro introducido es un número, comprueba que esté entre el 1000 y el año actual.
if ! [[ $1 -ge 1000 && $1 -le $anio ]] ; then 

    echo "El parámetro debe estar comprendido entre 1000 y el año actual ($anio)"
    exit 3
fi

#Se establece el resto del parámetro de entrada
resto=$(($1%12))
#Según el valor del resto (del 0 al 11), se ejecutará el case de dicho valor)
case $resto in
0)
echo "Según el horóscopo chino, tu animal es la rata"
;;
1)
echo "Según el horóscopo chino, tu animal es el buey"
;;
2)
echo "Según el horóscopo chino, tu animal es el tigre"
;;
3)
echo "Según el horóscopo chino, tu animal es el conejo"
;;
4)
echo "Según el horóscopo chino, tu animal es el dragón"
;;
5)
echo "Según el horóscopo chino, tu animal es la serpiente"
;;
6)
echo "Según el horóscopo chino, tu animal es el caballo"
;;
7)
echo "Según el horóscopo chino, tu animal es la cabra"
;;
8)
echo "Según el horóscopo chino, tu animal es el mono"
;;
9)
echo "Según el horóscopo chino, tu animal es el gallo"
;;
10)
echo "Según el horóscopo chino, tu animal es el perro"
;;
11)
echo "Según el horóscopo chino, tu animal es el cerdo"
;;
esac