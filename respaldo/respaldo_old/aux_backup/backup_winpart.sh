#!/bin/bash
# -----------------------------------
# Script  to make a full backup
# of my own personal machine  
# Ángel Alonso, 22.08.11
# --------------------------------------------
# What it does:
# Check whether it is being run as a root
# Check whether the volume is mounted or not
# ----
# To do:
# Backup of the Windows Partition
# Backup of the Linux system Partition
# Backup of the Main Data Partition
# 


if [ "$(whoami)" != "root" ]; then
        echo "ERROR: Not running as root. Exiting..."
        exit 0
else
        echo "INFO: Running as root."
fi 

if grep -qs '/media/6472EF9072EF64F0' /proc/mounts; then
  echo "INFO: The volume to put the backup on is mounted. Continuing..."
  if grep -qs '/media/1C561AE9703CF6FB' /proc/mounts; then
    echo "ERROR: Volume for the dd is mounted."
    exit 0
  else
    dd if=/dev/sda3 bs=1024 conv=noerror,sync | pv | \
    gzip -c -9 > /media/6472EF9072EF64F0/BACKUP/backup-winpart_sda3.gz   
    echo "INFO: Backup properly done. Have a nice day!"
  fi
else
  echo "ERROR: The volume we need to put the backup on is not mounted." 
  echo "Please mount the volume before restarting the backup"
  exit 0
fi


