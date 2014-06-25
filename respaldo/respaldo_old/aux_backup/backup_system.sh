#!/bin/bash
# -----------------------------------
# Script para hacer Backups con rsync
#      de mi máquina personal
#
#  thanks to Jesse Harris
#  http://ubuntuforums.org/showthread.php?t=80790
#
# Ángel Alonso, 22.08.11
# --------------------------------------------
# Funciones que realiza:
# 
# -------------------------------------------- 
# Wishlist
#  encrypt the /home backup
#     gpg --output backup_home.gpg --encrypt backup_home.tgz
#     rm backup_home.tgz
#     gpg --output backup_home.tgz --decrypt backup_home.gpg

if [ "$(whoami)" != "root" ]; then
        echo "Not running as root. Exiting..."
        exit 0
else
        echo "Running as root. Good"
fi 

cd / 

echo "directorio cambiado" 

tar -cvpzf /media/BIG_DATA/BACKUP/backup.tgz --exclude=/proc --exclude=/lost+found \
--exclude=/media --exclude=/home --exclude=/mnt --exclude=/sys /

echo "tar realizado"
