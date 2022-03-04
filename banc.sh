#!/bin/bash
clear

# 1 - En cas de no està generat que generi un arxiu banc.txt.

function crearFitxer (){
FICHERO=banc.txt
if [ -f $FICHERO ]
then
    echo
else
    touch banc.txt
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

for arg in "$@" 
do
    if [ "$arg" == "-add" ] || [ "$arg" == "-a" ] 
    then
        crearFitxer
        echo "HOla puta"
    fi
done