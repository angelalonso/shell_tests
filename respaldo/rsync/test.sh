#!/bin/bash
# -----------------------------------

orig_sgur="/home/aaf"
dest_sgur="/media/BIG_DATA/BACKUP_sgur/backup_home.tar"

tar cvf $dest_sgur $orig_sgur/Audiobooks
tar rvf $dest_sgur $orig_sgur/Desktop
tar rvf $dest_sgur $orig_sgur/Documents
tar rvf $dest_sgur $orig_sgur/Downloads
tar rvf $dest_sgur $orig_sgur/Music
tar rvf $dest_sgur $orig_sgur/Pictures
tar rvf $dest_sgur $orig_sgur/Podcasts
tar rvf $dest_sgur $orig_sgur/Public
tar rvf $dest_sgur $orig_sgur/racer
tar rvf $dest_sgur $orig_sgur/scripts
tar rvf $dest_sgur $orig_sgur/Templates
# tar rvf $dest_sgur $orig_sgur/Ubuntu One
tar rvf $dest_sgur $orig_sgur/Videos
tar rvf $dest_sgur $orig_sgur/workspace

tar rvf $dest_sgur $orig_sgur/.adobe
tar rvf $dest_sgur $orig_sgur/.audacity-data
tar rvf $dest_sgur $orig_sgur/.blender
tar rvf $dest_sgur $orig_sgur/.bogofilter
tar rvf $dest_sgur $orig_sgur/.cache
tar rvf $dest_sgur $orig_sgur/.camel_certs
tar rvf $dest_sgur $orig_sgur/.compiz
tar rvf $dest_sgur $orig_sgur/.config
tar rvf $dest_sgur $orig_sgur/.dbus
tar rvf $dest_sgur $orig_sgur/.eclipse
tar rvf $dest_sgur $orig_sgur/.ecryptfs
tar rvf $dest_sgur $orig_sgur/.etracer
tar rvf $dest_sgur $orig_sgur/.fontconfig
tar rvf $dest_sgur $orig_sgur/.frozen-bubble
tar rvf $dest_sgur $orig_sgur/.gconf
tar rvf $dest_sgur $orig_sgur/.gconfd
tar rvf $dest_sgur $orig_sgur/.gegl-0.0
tar rvf $dest_sgur $orig_sgur/.gimp-2.6
tar rvf $dest_sgur $orig_sgur/.gnome
tar rvf $dest_sgur $orig_sgur/.gnome2
tar rvf $dest_sgur $orig_sgur/.gnome2_private
tar rvf $dest_sgur $orig_sgur/.gnupg
tar rvf $dest_sgur $orig_sgur/.gstreamer-0.10
tar rvf $dest_sgur $orig_sgur/.gvfs
tar rvf $dest_sgur $orig_sgur/.icedtea
tar rvf $dest_sgur $orig_sgur/.icons
tar rvf $dest_sgur $orig_sgur/.libreoffice
tar rvf $dest_sgur $orig_sgur/.local
tar rvf $dest_sgur $orig_sgur/.macromedia
tar rvf $dest_sgur $orig_sgur/.marsshooter
tar rvf $dest_sgur $orig_sgur/.mc
tar rvf $dest_sgur $orig_sgur/.mission-control
tar rvf $dest_sgur $orig_sgur/.mozilla
tar rvf $dest_sgur $orig_sgur/.nautilus
tar rvf $dest_sgur $orig_sgur/.openarena
tar rvf $dest_sgur $orig_sgur/.pki
tar rvf $dest_sgur $orig_sgur/.Private
tar rvf $dest_sgur $orig_sgur/.pulse
tar rvf $dest_sgur $orig_sgur/.shotwell
tar rvf $dest_sgur $orig_sgur/.Skype
tar rvf $dest_sgur $orig_sgur/.ssh
tar rvf $dest_sgur $orig_sgur/.themes
tar rvf $dest_sgur $orig_sgur/.thumbnails
tar rvf $dest_sgur $orig_sgur/.thunderbird
tar rvf $dest_sgur $orig_sgur/.tuxguitar-1.2
tar rvf $dest_sgur $orig_sgur/.vdrift
tar rvf $dest_sgur $orig_sgur/.vim
tar rvf $dest_sgur $orig_sgur/.VirtualBox
tar rvf $dest_sgur $orig_sgur/.xine
tar rvf $dest_sgur $orig_sgur/.zenmap
tar rvf $dest_sgur $orig_sgur/.zsnes

tar rvvf $dest_sgur --no-recursion $orig_sgur/*
tar rvvf $dest_sgur --no-recursion $orig_sgur/.*



