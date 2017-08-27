#!/bin/bash
#
#Programa firewall_usb.sh
#Autores BalbuDiana & Joule7
#
#Saludo interactivo
echo "Hi $USER!"
echo "You're run : $0 program"

#CONTROL=0
#while [ $CONTROL=0 ] ; do
	echo "test"
        #Creacion de nuestras listas blanca y negra donde pondremos el nombre de las usb's
        touch WhiteList.txt | touch BlackList.txt
        cat /etc/mtab | grep media >> /dev/null
	echo "test 2"
        #if [ $? -ne 0 ]; then
		echo "test 3"
                CONTROL=0
        #else
		echo "test 4"
                CONTROL=1
         #       for USBDEV in `df | grep media | awk -F / {'print $5'}` ; do
			echo "test 5"
                        echo "Se a conectado: $USBDEV"
			echo "test 6" 
                        echo "1)Montar y Ejecutar 2)Añadir a la lista Blanca 3)Añadir a la lista Negra 4)Desmontar"
                        read eleccion
                                case $eleccion in
					1) echo $USBDEV >> WhiteList.txt
						mount /dev/sdc1
                                                sudo eject /dev/sdc1
						CONTROL=1;;
                                        2) echo $USBDEV >> WhiteList.txt
						CONTROL=1;;
					3) echo $USBDEV >> BlackList.txt
						CONTROL=1;;
                                        4) echo $USBDEV >> BlackList.txt
						mount /dev/sdc1
						CONTROL=1;;
					*) echo "opcion invalida";;
				esac
	#			break;
	#	done
        #fi                 
#done
exit 0
