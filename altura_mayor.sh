#Haz un script llamado altura_mayor.sh, que pida por teclado la altura en centímetros de tres personas y nos diga la mayor de las 3 en metros.

#!/bin/bash
es_numero='^[0-9]+$'
#Pide al menos tres parámetros y si no sale del programa
if [ $# -le 2 ]
then
	echo "Debes introducir al tres un parámetro"
	exit 1
fi
#Si el parámetro introducido no es un número entero, sale del programa
if ! [[ $1$2$3 =~ $es_numero ]] ; then
   echo "Los parámetros deben ser números enteros" 
   exit 1
fi

if [[ $1 -gt $2 ]]; then

    if [[ $1 -gt $3 ]]; then

        let resultado=$(($1 / 100))
        division=$(echo "scale=2; $1/100" | bc)
        echo "La mayor altura es de $division metros"
    
    else
    
        let resultado=$(($3 / 100))
        division=$(echo "scale=2; $3/100" | bc)
        echo "La mayor altura es de $division metros"

    fi

elif [[ $2 -gt $3 ]]; then  

    let resultado=$(($2 / 100))
    division=$(echo "scale=2; $2/100" | bc)
    echo "La mayor altura es de $division metros"

else 
    let resultado=$(($3 / 100))
    division=$(echo "scale=2; $3/100" | bc)
    echo "La mayor altura es de $division metros"
fi