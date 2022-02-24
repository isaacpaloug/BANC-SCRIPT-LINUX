#!/bin/bash
clear

# 1 - En cas de no està generat que generi un arxiu banc.txt.

function crearFitxer (){
FICHERO=banc.txt
if [ -f $FICHERO ]
then
    echo "El fitxer ja existeix."
else
    touch banc.txt
fi
}

# 2 - Fitxer d'ajuda

function ajuda (){
    echo "Aquest script serveix com a app d'un sistema bancari"
    echo "---------------------------------------------------------"
    echo "DESCRIPCIÓ                                              |"
    echo "OPCIONS                                                 |"
    echo "CÓDIGOS DE RETORNO                                      |"
    echo "                                                        |"
    echo "0 No hi ha cap error.                                   |"                    
    echo "1 L'opció introduïda no és vàlida.                      |"
    echo "2 Un argument númeric no és un número.                  |"
    echo "3 El nombre de paràmetres és erroni.                    |"
}
for arg in "$@" 
do
    if [ "$arg" == "-help" ] || [ "$arg" == "-h" ] 
    then
        ajuda
    fi
done