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
   echo "El primer parámetro debe ser un número entero" 
   exit 1
fi

#Si llega a esta parte del programa es porque se cumple todo lo anterior, así que guarda el módulo del numero introducido entre 10 en una variable

n=$1%10;

if [[ n -eq 0 ]]; then
   echo "$1 es múltiplo de 10"

else
   echo "$1 no es múltiplo de 10"
fi