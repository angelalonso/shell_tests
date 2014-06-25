#!/bin/bash
#
# ######################### #
# Declaración de constantes #
# ######################### #
# 
SEQ=/usr/bin/seq
usr=`whoami`
hm="/home/$usr"                    # Directorio Home
bfldr="$hm/.backup_sh"             # Directorio para archivos del programa
logfldr="$bfldr/log"               # Directorio para guardar los logs
config=""

# ######################## #
# Declaración de funciones #
# ######################## #

function ayuda(){
  echo "backup.sh  versión 0.1.0"
  echo "Sin copyright (C) en absoluto, pero creado por Angel Alonso Fonseca."
  echo
  echo "backup.sh NO TIENE GARANTÍA DE USO. Se trata de Software Libre,"
  echo "y eres bienvenido si deseas modificarlo o distribuirlo."
  echo "Si copias hasta la última coma este código y alguien acepta pagarte"
  echo "por una licencia, no interpondré queja alguna, pues entiendo que "
  echo "has tenido el arte de tomarle el pelo a alguien sin el menor interés"
  echo "en comprobar que no le timen."
  echo
  echo "backup.sh es un programa que gestiona tus backups de una manera"
  echo "relativamente eficiente, y adaptable a la situación del usuario."
  echo
  echo "  -p,  --preparar"
  echo "       --prepare     prepara un archivo de configuración para backups"
  echo 
  echo "  -c,  --copiar"
  echo "  -d,  --do          realiza el backup conforme al archivo de configuración"
  echo
  echo "  -a,  --ayuda"
  echo "  -h,  --help        muestra esta ayuda y finaliza"
  echo
  echo "Por cierto, el 31 de Marzo es el día mundial del Backup" 
  echo "(en caso de que sólo quieras hacer uno al año)"
}

function discos_prueba(){
  if grep -qs $1 /proc/mounts; then
    echo "It's mounted."
  else
    echo "It's not mounted."
  fi
}

function config_interpretar(){
echo Ha elegido $1
# ## confirmacion aqui (o tras leer el archivo)   
while read line
do
# Como siempre, un # marca el inicio de un comentario en el archivo de configuración 
 if [ ${line:0:1} != "#" ] ; then
   echo $line
 fi
done < $1

}

function config_escoger(){
if [ -d "$bfldr" ]; then
  if [ "$(ls -A $bfldr)" ]; then
    confmatriz=( `ls $bfldr | tr '\n' ' '`)
    respuesta=${#confmatriz[@]}
    until [ $respuesta -ge 0 ] && [ $respuesta -le $((${#confmatriz[@]} - 1)) ] ; do
    echo  "Elija un fichero de configuración (número seguido de <Enter>):"
      for i in $($SEQ 0 $((${#confmatriz[@]} - 1)))
      do
        echo $i  - ${confmatriz[$i]}
      done
      read respuesta
    done
    config_interpretar $bfldr/${confmatriz[$respuesta]}   
  else
    echo "$bfldr está vacío"
# ## posibilidad de crear archivos de configuración desde aquí
  fi
else
  echo El directorio de trabajo, $bfldr no existe
# ## posibilidad de crear el directorio desde aquí
fi
}

function copiar(){
# Comprueba si hay un archivo de configuración

config_escoger
# rsync de cada carpeta



##rsync -cgloprtuvz --progress --stats $bd_aud \
##$dsk 2> $log/backup_audio.log 

##rsync -cgloprtuvz --progress --stats $bd_doc \
##$dsk 2> $log/backup_docs.log 

#echo "$logfldr/backup_audio.log"
#echo "$logfldr/backup_docs.log"
}

function preparar(){
echo hola mundo
}

function menu(){
  ayuda
}

# ################## #
# Programa principal #
# ################## #

case $1 in
  ""|-h|-help|--h|--help|-a|-ayuda|--a|--ayuda) 
    ayuda;;
  -d|-do|--d|--do|-c|-copiar|--c|--copiar) 
    copiar;;
  -r|-restore|--r|--restore|-restaurar|--restaurar) 
    restaurar;;
  -p|-prepare|-preparar|--p|--prepare|--preparar)
    preparar;;
  *) 
    menu;;
esac

# POR HACER: si no se entra ninguna opción, mostrar menú
# POR HACER: el menú muestra las opciones (para la próxima)
# POR HACER: menú de configuración, que genera un fichero de configuración
# POR HACER: configuración siempre en uno o varios ficheros aparte
# POR HACER: esos ficheros estarán en /home/user/backup_sh...
# POR HACER: ...y tendrán por nombre _media_disco (uno por disco de destino)
# POR HACER: los discos de destino se eligen de los montados, o manualmente.
# POR HACER: Comprobar siempre que el disco está montado
# POR HACER: La reuperación desde Backup usará también esos archivos de configuración.
# POR HACER: Pero habrá la posibilidad de encontrarlo manual si no hay archivo.
# POR HACER: Limpieza de temporales


