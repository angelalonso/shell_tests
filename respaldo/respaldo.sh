#!/bin/bash

HOME="/home/aaf"

BCK_DEST="/media/6472EF9072EF64F0/BACKUP"
BCK_DEST_HOME="$BCK_DEST/PC"
PACKAGE_LIST="$BCK_DEST_HOME/package_list.txt"

COMMON_FOLDERS=( Documentos Imágenes scripts Software Vídeos )



for FOLDER in ${COMMON_FOLDERS[@]}; do
	echo "Haciendo Copia de Seguridad de $FOLDER..."
	rsync -cgloprtuvz --progress --stats $HOME/$FOLDER $BCK_DEST 
done

for HOME_FOLDER in `ls -lha $HOME | awk '{print $9}'`; do
	OK="yes"
	for BLACKLIST in ${COMMON_FOLDERS[@]} ; do
		if [ "$OK" == "yes" ]; then
			if [ "$HOME_FOLDER" == "$BLACKLIST" ]; then
				OK="no"
			fi  
		fi  
	done
	if [ "$OK" == "yes" ]; then
		echo "Haciendo Copia de Seguridad de $HOME_FOLDER..."
		rsync -cgloprtuvz --progress --stats $HOME/$FOLDER $BCK_DEST_HOME
	else
		echo "Obviando $HOME_FOLDER-----------------------"
	fi  
done

# Realizar una copia de los paquetes actualmente instalados
dpkg -l | awk '{ print $2}' > $PACKAGE_LIST
up_desarrollo3(){
mkdir $des_destino-3
rsync -cgloprtuvz --progress --stats $des_destino-2/scripts $des_destino-3  2> $log/bck_desarrollo.log
rsync -cgloprtuvz --progress --stats $des_destino-2/Documentos $des_destino-3  2> $log/bck_desarrollo.log
}

function backup_desarrollo4(){
mkdir $des_destino-4
rsync -cgloprtuvz --progress --stats $des_destino-3/scripts $des_destino-4  2> $log/bck_desarrollo.log
rsync -cgloprtuvz --progress --stats $des_destino-3/Documentos $des_destino-4  2> $log/bck_desarrollo.log
}

function backup_normal(){
rsync -cgloprtuvz --progress --stats --exclude "/Crash\ Reports" $nor_origen $nor_destino/.mozilla  2> $log/bck_normal.log
}

function backup_cloud(){
for file in `ls $filelist` ; do
  cat $filelist/$file | while read line 
  do
    Origen=`echo $line | awk '{ print $1 }'`
    Destino=`echo $line | awk '{ print $2 }'`
    rsync -cgloprtuvz --progress --stats $Origen $Destino 2> $log/bck_cloud.log
  done
done
}


case $1 in
  -d)
    backup_desarrollo;;
  -d2)
    backup_desarrollo2;;
  -d3)
    backup_desarrollo3;;
  -d4)
    backup_desarrollo4;;
  -n)
    backup_normal;;
  -c)
    backup_cloud;;
  -s)
    echo sistema;;
  *)
    echo posibilidades -d -d2 -d3 -d4 -n -c -s;;
esac
