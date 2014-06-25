#!/bin/bash
# -----------------------------------
# Script para hacer Backups con rsync
#      de mi máquina personal
# Ángel Alonso, 22.08.11
# --------------------------------------------
# Funciones que realiza:
# ----
# - Copia incremental
#
# --------------------------------------------
# Funciones que debería realizar:
# ----
# - Copia de TODAS las carpetas menos
# ...................................
#    *~   - "back in time" says so
#    /home/aaf/Ubuntu One - "back in time" says so
#    *.backup* - "back in time" says so
#    .dropbox* - "back in time" says so
#    .[Cc]ache*
#    .thumbnails*
#    .[Tt]rash - "back in time" says so
#    .gvfs ?? - yes, "back in time" says so
#    .private ??
#    Private ??
# ...................................
#    - .ecryptfs ???
#    - archivos temporales
#    - cache firefox?
# - Ajuste preciso de opciones
# - Copia de archivos de sistema
# - Separación carpetas criticas -> rsync vs crypto
# - Puenteo de permisos
# - Comprobación de volumen de destino montado
# - Estadísticas
#     tiempo de ejecución
# ...................................
# Archivos a proteger:
# /etc/security/opasswd
# e-mail -> tar, crypto
# ...................................

orig1="/bin /boot /cdrom /dev /etc"
orig2="/home /lib /lost+found /opt"
orig3="/proc /root /sbin /selinux"
orig4="/srv /sys /tmp /usr /var"

orig_sgur=""
excl=exclude_files.txt
dest="/media/DATA/BACKUP"
dest_sgur="/media/DATA/BACKUP_sgur"

rsync -cgloprtuvz --progress --stats --delete --exclude-from=$excl $orig1 \
$dest >  /tmp/myoutput1.log &
rsync -cgloprtuvz --progress --stats --delete --exclude-from=$excl $orig2 \
$dest >  /tmp/myoutput2.log &
rsync -cgloprtuvz --progress --stats --delete --exclude-from=$excl $orig3 \
$dest >  /tmp/myoutput3.log &
rsync -cgloprtuvz --progress --stats --delete --exclude-from=$excl $orig4 \
$dest >  /tmp/myoutput4.log &

