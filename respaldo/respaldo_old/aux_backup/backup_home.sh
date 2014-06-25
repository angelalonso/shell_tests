#!/bin/bash
# -----------------------------------
# Script para hacer Backups con tar  
#      de mi máquina personal
# Ángel Alonso, 22.08.11
# --------------------------------------------
# Funciones que realiza:
# ----
# 
if [ "$(whoami)" != "root" ]; then
        echo "Not running as root. Exiting..."
        exit 0
else
        echo "Running as root. Go ahead!"
fi 

cd / 

echo "directorio cambiado" 

tar -cvpzf /media/BIG_DATA/BACKUP/backup_home.tgz /home/ --exclude=/home/.ecryptfs \
--exclude=/home/lost+found --exclude=/home/aaf/VirtualBox\ \VMs \
--exclude=/home/aaf/.cache

echo "tar del directorio home realizado"

