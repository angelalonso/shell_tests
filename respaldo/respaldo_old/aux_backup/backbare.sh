#!/bin/bash

# diferentes parametros, diferentes backups, hecho por cronjob
des_origen="/home/aaf/Documentos"
des_origen2="/home/aaf/scripts"
des_destino="/home/aaf/.bck_Documentos"
log="/home/aaf/.backup_sh/log"

nor_origen="/home/aaf/.mozilla/firefox"
nor_origen2="/home/aaf/.thunderbird"
nor_destino="/media/6472EF9072EF64F0/SYSTEM"

function backup_desarrollo(){

mkdir $des_destino
rsync -cgloprtuvz --progress --stats $des_origen2 $des_destino  2> $log/bck_desarrollo.log 
rsync -cgloprtuvz --progress --stats $des_origen $des_destino  2> $log/bck_desarrollo.log 

}

function backup_desarrollo2(){

mkdir $des_destino-2
rsync -cgloprtuvz --progress --stats $des_destino/scripts $des_destino-2  2> $log/bck_desarrollo.log
rsync -cgloprtuvz --progress --stats $des_destino/Documentos $des_destino-2  2> $log/bck_desarrollo.log

}

function backup_desarrollo3(){

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
  -s)
    echo sistema;;
  *)
    echo posibilidades -d -d2 -d3 -d4 -n -2;;
esac
