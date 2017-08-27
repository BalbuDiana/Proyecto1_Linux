#!/bin/bash
#
#Programa firewall_usb.sh
#Autores BalbuDiana & Joule7
#
#Saludo interactivo
echo "Hi $USER!"
echo "You're run : $0 program"

CONTROL=0
while [ $CONTROL=0 ] ; do
        #Creacion de nuestras listas blanca y negra donde pondremos el nombre de las usb's
        touch WhiteList.txt | touch BlackList.txt
        cat /etc/mtab | grep media >> /dev/null
	#Declaracion de la barible USB
	USB=$(dmesg | tail -n20 | grep ": Serial" | awk '{print $6}' )
        if [ $? -ne 0 ]; then
                CONTROL=0
        else
                CONTROL=1
		echo "Se a conectado: $USB" 
                echo "1)Montar y Ejecutar 2)Añadir a la lista Blanca 3)Añadir a la lista Negra 4)Desmontar"
		read eleccion
			case $eleccion in
				1) echo $USB >> WhiteList.txt
					mount /dev/sdc1
					sudo eject /dev/sdc1
					CONTROL=1;;
				2) echo $USB >> WhiteList.txt
					CONTROL=1;;
				3) echo $USB >> BlackList.txt
					CONTROL=1;;
				4) echo $USB >> BlackList.txt
					mount /dev/sdc1
					CONTROL=1;;
				*) echo "opcion invalida";;
			esac
			break;
	fi                 
done
exit 0
