#!/bin/bash
clear
# FUNCIONES


# MENU
function menu(){
    echo "+---------------------------------------------------------------+"
    echo "|   MENU DEL BANC                                               |"
    echo "+---------------------------------------------------------------+"
    echo "|   a - Afegir un moviment bancari.                             |"
    echo "|   b - Cerca un movimient bancari.                             |"
    echo "|   l - Lista tots els moviments bancaris ordenats per data.    |"
    echo "|   t - Calcula el saldo total del compte.                      |"
    echo "|   s - Sortir del script.                                      |"
    echo "+---------------------------------------------------------------+"
}
# HELP
function ayuda (){
    echo "-----------------------------------------------------------------------------------"
    echo "SYNOPSIS                                                                          |"                                             
    echo "./banc OPCIÓ [paràmetre_1] ... [paràmetre_n]                                      |"
    echo "                                                                                  |"
    echo "DESCRIPCIÓ                                                                        |"
    echo "Fes operacions senzilles amb operacions bancàries                                 |"
    echo "                                                                                  |"
    echo "OPCIONS                                                                           |"
    echo "   a    DATA CONCEPTE QUANTITAT     Afageix un moviment bancari                   |"
    echo "   b    PATRÓ                       Cerca un moviment bancari.                    |"
    echo "   l                    Llista de tots els moviments bancaris ordenats per data   |"
    echo "   t                                Calcula el saldo total del compte             |"
    echo "   s      º                         Sortir del script                             |"
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
        ayuda
    fi
done
# ###################################################################################################################
# FUNCIONS DE OPCIONS ###############################################################################################
# ###################################################################################################################

# FUNCIO AFEGIR MOVIMENT BANCARI
function add() {
    echo "HAS TRIAT L'OPCIÓ PER AFEGIR UN MOVIMENT BANCARI:"
    read -r -p "Introdueix una data vàlida: " DATA
    read -r -p "Introdueix el concepte: " CONCEPTE
    read -r -p "Introdueix la quantitat: " QUANTITAT
    ./banc.sh -add "$DATA" "$CONCEPTE" "$QUANTITAT"
    elegir_menu
}
#FUNCIO CERCAR MOVIMENT BANCARI
function cercar() {
    echo "HAS TRIAT L'OPCIÓ DE CERCAR UN MOVIMENT BANCARI."
    read -r -p "Introdueix element a cercar: " PARAULA
    ./banc.sh -s "$PARAULA"
    elegir_menu
}
function opcio_incorrecte() {
    echo "La opció '$1' és incorrecte."
    elegir_menu
}
# FUNCIÓ PER IMPRIMIR LLISTA DE MOVIMENTS BANCARIS
function llista() {
    ./banc.sh -l
}

# FUNCIÓ PER TRIAR EL MENU:

function triar_menu() {
    menu
    read -r -p "Tria una opció: " OPCIONS
    clear
    case "$OPCIONS" in
        a) add;;
        b) cercar;;
        l) llista;;
        t) total;;
        s) sortir;;
        *) opcio_incorrecte "$OPCIONS";;
    esac
}
triar_menu