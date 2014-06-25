#!/bin/bash

gxmessage "¿Desea hacer una copia de seguridad en el Disco USB que se acaba de introducir?" -center -title "Elija una opción" -default "Cancelar" -buttons "Cancelar":1,"Realizar":2 

case $? in
    1)
        echo "Exit";;
    2)
gxmessage "Gracias" -center -title "Gracias" -default "Ok" -buttons "Ok":1;; 
esac
