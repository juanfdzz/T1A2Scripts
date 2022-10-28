#7. Haz un script llamado sumarango.sh, que pida dos números por teclado y calcule la suma de los números que conforman ese rango. 
#El resultado tiene que estar mostrado de dos formas, obtenido mediante el comando seq, y mediante la nomenclatura usada en lenguaje C.
#Por ejemplo: Si introducimos el 5 y el 8 debemos mostrar el 26  por pantalla que es el resultado de sumar 5+6+7+8.

#OPCIONAL: El programa comprueba qué número es menor antes de calcular la suma del rango para poder invetir el orden en caso necesario, 
#por si introdujeramos primero el mayor evitar entrar en un bucle erroneo.

#!/bin/bash

es_numero='^[0-9]+$'

#Pide los dos números
read -p "Introduce el primer número: " num1
read -p "Introduce el segundo número: " num2
#Comprueba que los dos valores obtenidos sean, en efecto, números
if ! [[ $num1 =~ $es_numero && $num2 =~ $es_numero ]] ; then
    echo "Debe introducir un número en ambos campos para que funcione el programa!"
    exit 1
fi
#En esta parte, con un if, mete los valores pedidos en variables según cuál sea el mayor y menor, para así ignorar el orden de entrada.
if [[ $num1 -gt $num2 ]]; then
    menor=$num2
    mayor=$num1
    
else
    menor=$num1
    mayor=$num2

fi

#Aquí se hace la sumatoria del rango entre los dos valores utilizando el método de bash SEQ

sumaseq=0
for i in `seq $menor $mayor`
do
    sumaseq=`expr $sumaseq + $i`
done
echo "La suma con el comando seq es: $sumaseq"

#Aquí se hace la sumatoria del rango entre los dos valores utilizando la nomenclatura usada en C

suma=0
for (( n=menor; n<=mayor; n++ ))
do  
    suma=`expr $suma + $n`
done
echo "La suma usando la nomenclatura C es: $suma"