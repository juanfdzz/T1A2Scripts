#8. Implementar un script llamado calculadora.sh que muestre el siguiente menú:
#1)Sumar
#2)Restar
#3)Dividir
#4)Multiplicar
#5)Salir

#Después de mostrar el menú, se pedirá que se elija una opción. Si la opción elegida no está entre el 1 y el 4, 
#se mostrará un mensaje de error. En caso de que la opción sea válida, se pediran dos números por teclado y en función de la opera-ción elegida, 
#se devolverá el resultado por pantalla, manejando posibles errores al introducir caracteres.
#- Cada operación será implementada haciendo uso de funciones
#- Si la opción elegida no es válida, se volverá a mostrar el menú
#- Si el script arroja algún error debe almacenarse en un fichero con log de errores creado para la ocasión (con contenido independiente cada 
#vez que se ejecuta el script).
#- El programa terminará, cuando pulse 5.




#!/bin/bash

es_numero='^[0-9]+$'

#Se definen las funciones de la 1 a la 5 para que cada una haga una operación concreta.

opcion1(){ 
	  echo "Introduce dos números para realizar la función seleccionada"
	  read numero1
	  read numero2

	  if ! [[ $numero1$numero2 =~ $es_numero ]] ; then
   		echo "Los parámetros deben ser números enteros" 
		echo "`date`: Ocurrió un error al ejecutar el script $0, no se le introdujo un valor correcto para realizar el cálculo" >> errores8.log
   		exit 1
	  else
   		resultado=$(($numero1 + $numero2))
   		echo "El resultado de la suma es $resultado"
          fi

}

opcion2(){ 
	  echo "Introduce dos números para realizar la función seleccionada"
	  read numero1
	  read numero2

	  if ! [[ $numero1$numero2 =~ $es_numero ]] ; then
   		echo "Los parámetros deben ser números enteros" 
		echo "`date`: Ocurrió un error al ejecutar el script $0, no se le introdujo un valor correcto para realizar el cálculo" >> errores8.log
   		exit 1
	  else
   		resultado=$(($numero1 - $numero2))
   		echo "El resultado de la resta es $resultado"
	  fi

}

opcion3(){ 
	  echo "Introduce dos números para realizar la función seleccionada"
	  read numero1
	  read numero2

	  if ! [[ $numero1$numero2 =~ $es_numero ]] ; then
   		echo "Los parámetros deben ser números enteros" 
		echo "`date`: Ocurrió un error al ejecutar el script $0, no se le introdujo un valor correcto para realizar el cálculo" >> errores8.log
   		exit 1
	  else
   		resultado=$(($numero1 * $numero2))
   		echo "El resultado de la multiplicación es $resultado"
	  fi

}

opcion4(){ 
	  echo "Introduce dos números para realizar la función seleccionada"
	  read numero1
	  read numero2

	  if ! [[ $numero1$numero2 =~ $es_numero ]] ; then
   		echo "Los parámetros deben ser números enteros" 
		echo "`date`: Ocurrió un error al ejecutar el script $0, no se le introdujo un valor correcto para realizar el cálculo" >> errores8.log
   		exit 1
	  else
   		resultado=$(echo "scale=2; $numero1/$numero2" | bc) #La división muestra dos decimales
   		echo "El resultado de la división  es $resultado"
	  fi

}

opcion5() { 
	  echo "Saliendo"
	  exit 0
}

#Con echo se muestran las distintas opciones y luego se lee el valor recibido con read. Según el número que sea (del 1 al 5), se ejecuta el case con las funciones
#previamente definidas.
echo "1. Sumar"
echo "2. Restar"
echo "3. Multiplicar"
echo "4. Dividir"
echo "5. Salir"
read opcion

case $opcion in
1) opcion1;;
2) opcion2;;
3) opcion3;;
4) opcion4;;
5) opcion5;;

esac

#Este bucle hace que, si no se le introduce un valor que no sea del 1 al 5, va a mostrar el menú anterior indefinidamente. Además del mensaje de error y 
#la redirección del mensaje de error al fichero 'errores8.log'

while [[ $opcion -ne 1 && $opcion -ne 2 && $opcion -ne 3 && $opcion -ne 4 && $opcion -ne 5 ]]
do
echo "ERROR. Debe introducir un valor comprendido entre el 1 y el 4"
sleep 1
echo "`date`: Ocurrió un error al ejecutar el script $0, el valor introducido no formaba parte de las opciones" >> errores8.log
echo "1. Sumar"
echo "2. Restar"
echo "3. Multiplicar"
echo "4. Dividir"
echo "5. Salir"
read opcion

case $opcion in
1) opcion1;;
2) opcion2;;
3) opcion3;;
4) opcion4;;
5) opcion5;;

esac
done
