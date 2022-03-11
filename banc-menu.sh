#!/bin/bash
clear
banco=/banc.sh 
function menu(){
    echo "+---------------------------------------------------------------+"
    echo "|   MENU DEL BANC                                               |"
    echo "+---------------------------------------------------------------+"
    echo "|   a - Afegir un moviment bancari.                             |"
    echo "|   b - Cerca un movimient bancarii.                            |"
    echo "|   l - Lista tots els moviments bancaris ordenatss per data.   |"
    echo "|   t - Calcula el saldo total del compte.                      |"
    echo "|   s - Sortir del script.                                      |"
    echo "+---------------------------------------------------------------+"
}
menu