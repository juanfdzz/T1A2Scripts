#Haz un script llamado diadelmes.sh,  que nos diga cuántos días tiene el mes actual en el momento de su ejecución (se considera que Febrero tiene 28 días). 
#La salida debe producirse en el siguiente formato: “Estamos en noviembre, un mes con 30 días”.

#!/bin/bash

#Obtiene el número equivalente al mes actual (0-12)
mes=$(date +%m)
#Un total de 12 if's para cada número del mes.
if [ $mes -eq 1 ]
then
echo "Estamos en enero, un mes con 31 días"
fi

if [ $mes -eq 2 ]
then
echo "Estamos en febrero, un mes con 28 días"
fi

if [ $mes -eq 3 ]
then
echo "Estamos en marzo, un mes con 31 días"
fi

if [ $mes -eq 4 ]
then
echo "Estamos en abril, un mes con 30 días"
fi

if [ $mes -eq 5 ]
then
echo "Estamos en mayo, un mes con 31 días"
fi

if [ $mes -eq 6 ]
then
echo "Estamos en junio, un mes con 30 días"
fi

if [ $mes -eq 7 ]
then
echo "Estamos en julio, un mes con 31 días"
fi

if [ $mes -eq 8 ]
then
echo "Estamos en agosto, un mes con 31 días"
fi

if [ $mes -eq 9 ]
then
echo "Estamos en septiembre, un mes con 30 días"
fi

if [ $mes -eq 10 ]
then
echo "Estamos en octubre, un mes con 31 días"
fi

if [ $mes -eq 11 ]
then
echo "Estamos en noviembre, un mes con 30 días"
fi

if [ $mes -eq 12 ]
then
echo "Estamos en diciembre, un mes con 31 días"
fi
