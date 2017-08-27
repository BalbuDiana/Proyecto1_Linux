#!/bin/bash
#
#Programa firewall_usb.sh
#Autores BalbuDiana & Joule7
#
#Saludo interactivo
zenity --info --text "Hi $USER! " " You're run : $0 program"
mkdir /dev/sddc1
touch /dev/sddc1/WhiteList.txt | /dev/sddc1/touch BlackList.txt   #Creacion de nuestras listas blanca y negra donde pondremos el nombre de las usb's
cat /etc/mtab | grep media

echo "Se a conectado: $USBDEV"
echo "test 6" 
if [(zenity --question --text "¿Está seguro de que desea dejar el ingreso de este dispositivo a su computadora? Esto puede presentar problemas después, puede ser hackeado u obervado desde el exterior"; echo $?)==1]; then
	echo $USBDEV >> WhiteList.txt
	mount /dev/sdc1
	sudo eject /dev/sdc1
else
	$USBDEV >> BlackList.txt
	mount /dev/sdc1

fi
