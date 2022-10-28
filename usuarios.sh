#9. Realizar un script que se llame usuarios.sh muestre la lista de información de un usuario del sistema 
#pasado por parámetro (nombre de usuario, UID, GID y directorio de trabajo).
#Cuando se muestre la información el script debe preguntar si quiere introducir otro usuario para mostrar 
#su info o si se quiere salir del programa.
#Se debe verificar que ese usuario está dado de alta en el sistema y por supuesto deberá mostrarse por 
#pantalla el mensaje oportuno de darse tal circunstancia. Los errores arrojados por los comandos empleados 
#serán enviados a un log destinado a ello, aunque el script avisará por pantalla si el usuario no existe.

#!/bin/bash
#Pide al menos un parámetro y si no sale del programa
if [ $# -le 0 ]
then
	echo "Debes introducir al menos un parámetro"
	exit 1
fi

if id "$1" &>/dev/null 2>>9error.log; then #Si el usuario existe entonces

    echo "Nombre: `cat /etc/passwd | grep -w $1 | cut -d ":" -f1`"
    echo "UID: `cat /etc/passwd | grep -w $1 | cut -d ":" -f3`"
    echo "GID: `cat /etc/passwd | grep -w $1 | cut -d ":" -f4`"
    echo -e "Directorio de trabajo: `cat /etc/passwd | grep -w $1 | cut -d ":" -f6` \n"

else #Si el usuario no existe entonces

    echo 'El usuario introducido no está dado de alta en el sistema'

fi

opcion1(){ #Función para mostrar información de los usuarios. Copia y pega del anterior pero con el valor del read
    read -p "Introduzca el nombre: " usuario
    echo ""
    if id "$usuario" &>/dev/null 2>>9error.log; then #Si el usuario existe entonces

    echo "Nombre: `cat /etc/passwd | grep -w $usuario | cut -d ":" -f1`"
    echo "UID: `cat /etc/passwd | grep -w  $usuario | cut -d ":" -f3`"
    echo "GID: `cat /etc/passwd | grep -w $usuario | cut -d ":" -f4`"
    echo -e "Directorio de trabajo: `cat /etc/passwd | grep -w $usuario | cut -d ":" -f6` \n"

else #Si el usuario no existe entonces

    echo -e 'El usuario introducido no está dado de alta en el sistema \n'

fi


}

opcion2(){ 
    echo "Saliendo del programa"
    exit 0
}

while [[ $opcion -ne 2 ]] #Mientras no se le pulse a la opción 2(salir), pregunta en bucle el menú de opciones
do
echo -e "¿Qué desea hacer? \n"
echo "1. Introducir otro usuario para mostrar su info"
echo "2. Salir del programa"
read opcion

case $opcion in
1) opcion1;;
2) opcion2;;

esac
done
