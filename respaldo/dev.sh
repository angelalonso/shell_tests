#!/bin/bash

HOME="/home/aaf"

BCK_DEST="/media/6472EF9072EF64F0/MAIN_BACKUP"
PACKAGE_LIST="$BCK_DEST_HOME/package_list.txt"
AGENT_NAMES=( Ana Ángel Antonio Arturo Beatriz Blas Carolina Cristina Daniel Diana Diego Felipe Fernando Ignacio Jorge José-María Manolo Marta Pablo Paco Pepe Ramón Raquel Sara Víctor )
AGENT_SURNAMES=( Alonso Díaz Hernández Fernández Fonseca García González Martínez Pelayo Pérez Ruiz Rodríguez Sánchez Urruti Valdés )
COMMON_FOLDERS=( Documentos Imágenes scripts Software Vídeos )

BACKUPOPT=0

gui_00(){
echo "--- BIENVENIDO AL PROGRAMA GESTOR DE RESPALDOS ---"
echo 
AGENTNAME=${AGENT_NAMES[$(($RANDOM % ${#AGENT_NAMES[@]}))]}
AGENTSURNAME=${AGENT_SURNAMES[$(($RANDOM % ${#AGENT_SURNAMES[@]}))]}
echo "Mi nombre es "$AGENTNAME" "$AGENTSURNAME 
echo 
while [[ $BACKUPOPT -ne 1 && $BACKUPOPT -ne 2 ]]
do
	echo "1) Actualizar tus copias de seguridad"
	echo "2) Sobreescribir ficheros actuales con el contenido de tus copias de seguridad"
	echo -n "¿En qué puedo ayudarle? (1/2): "
	read BACKUPOPT
	if [[ $BACKUPOPT -ne 1 && $BACKUPOPT -ne 2 ]]; then
		echo
		echo "--------------------------------------------------------------"
   		echo "ERROR: Por favor limítese a escribir 1 ó 2 y pulsar <Enter>..."
		echo "--------------------------------------------------------------"
	fi
done
}

save(){
echo
echo "Usted ha elegido hacer una nueva copia de seguridad"
echo "Por defecto, vamos a copiar todo lo que haya dentro del directorio:"
echo $HOME
echo "-------------------------------------------------------------------"
echo "en el directorio:"
echo $BCK_DEST
echo -n "Pulse <Enter> para confirmar "$BCK_DEST" como destino, o escriba una nueva dirección en caso contrario: "
read NEW_DEST
if [[ $NEW_DEST == "" ]]; then
	echo $BCK_DEST
else
	echo $NEW_DEST
fi
}


restore(){
echo "Usted ha elegido restaurar su sistema desde una copia de seguridad"
echo " por ahora, esta  opción no está implementada"
}
gui_00
case $BACKUPOPT in
	1)
		save;;
	2)
		restore;;
esac
