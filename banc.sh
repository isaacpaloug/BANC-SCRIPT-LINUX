#!/bin/bash
clear
BANC_FILE=banc.txt

# 1 - En cas de no està generat que generi un arxiu banc.txt.
function createFile (){
    if ! touch $BANC_FILE
    then
        echo "Error 5: Error al crear el fitxer"
    fi
}
# 2 - Fitxer d'ajuda

function ajuda (){
    echo "-----------------------------------------------------------------------------------"
    echo "SYNOPSIS                                                                          |"                                             
    echo "./banc OPCIÓ [paràmetre_1] ... [paràmetre_n]                                      |"
    echo "                                                                                  |"
    echo "DESCRIPCIÓ                                                                        |"
    echo "Fes operacions senzilles amb operacions bancàries                                 |"
    echo "                                                                                  |"
    echo "OPCIONS                                                                           |"
    echo "   -h -help                               Mostra una ajuda.                       |"
    echo "   -a -add    DATA CONCEPTE QUANTITAT     Afageix un moviment bancari             |"
    echo "   -s -search PATRÓ                       Cerca un moviment bancari.              |"
    echo "   -l -list                               Llista de tots els moviments bancaris   |"
    echo "   -t -total                              Calcula elsaldo total del compte        |"
    echo "                                                                                  |"
    echo "CÒDIS DE RETORN                                                                   |"
    echo "    0 No hi ha cap error.                                                         |"                    
    echo "    1 L'opció introduïda no és vàlida.                                            |"
    echo "    2 Un argument númeric no és un número.                                        |"
    echo "    3 El nombre de paràmetres és erroni.                                          |"
    echo "    4 Un argument de tipus data no és una data                                    |"
    echo "    5 Hi ha un error d'entrada/sortida a .banc.txt                                |"
}

for arg in "$@" 
do
    if [ "$arg" == "-help" ] || [ "$arg" == "-h" ] 
    then
        ajuda
    fi
done

# 3 - Escriure al txt

function escriure (){
        shift
        DATE="$1"
        CONCEPTE="$2"
        QUANTITAT="$3"
        if [ $# != 3 ]
        then
            echo "Error 3: Mínim número de paràmetres: 3"
        else
            if [ "$(echo "$DATE" | grep -E "^20[0-9]{2}-[01][0-9]-[0-3][0-9]$")" == "" ]; then
            echo "No es una data vàlida";
            else
                echo "$DATE $CONCEPTE $QUANTITAT" >> $BANC_FILE
            fi
        fi
}

for arg in "$@" 
do
    if [ "$arg" == "-add" ] || [ "$arg" == "-a" ] 
    then
        escriure $@
    fi
done

# 4 - Cercar un moviment bancari.
function cercar (){
    shift
    palabra="$1"
    grep -r -i "$palabra" $BANC_FILE
}

for arg in "$@" 
do
    if [ "$arg" == "-search" ] || [ "$arg" == "-s" ] 
    then
        cercar $@
    fi
done

# 5 - Pinta la llista ordenada per data

for arg in "$@" 
do
    if [ "$arg" == "-list" ] || [ "$arg" == "-l" ] 
    then
        sort $BANC_FILE
    fi
done

# INICIO APP
function iniciarApp(){
    createFile
}
iniciarApp