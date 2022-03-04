
# Realitzar un script amb el nom ‘banc’, el que ha de fer és:


### **1 - En cas de no està generat que generi un arxiu banc.txt.**


### **2 - Amb l’script s’han de poder executar les següents comandes:**

>./banc.sh -help / -h

Pinta per pantalla l’ajuda amb el disseny de linux.

SYNOPSIS

….

DESCRIPCIÓ

….

OPCIONS

….

CÓDIGOS DE RETORNO

….

>./banc.sh -add / -a 17-06-2022 Concepte Quantitat

Afegeix una linea a l’arxiu banc.txt indicant la data.

Per comprovar que la data té un format correcte:

  >if [ "$(echo "$DATE" | grep -E "^20[0-9]{2}-[01][0-9]-[0-3][0-9]$")" == "" ]; then

>./banc.sh -search / -s Patró

Cerca un moviment bancari

>./banc.sh -list / -l

Pinta la llista ordenada per data

>./banc.sh -total / -t

Calcula el total de saldo del compte.




### **3 - S’ha de fer un control d’errors i en cas d’error ha de tornar un missatge amb l’estructura següent:**


NomComanda: linea NumLinea: Error CodiError: Missatge

Els codis d’error i el missatges són:

0 Si no hi ha cap error. <br>
1 SI l'opció introduïda no és vàlida.<br>
2 Si un argument númeric no és un número.<br>
3 Si el nombre de paràmetres és erroni.<br>
4 Si un argument de tipus data no és una data.<br>
5 Si hi ha un error d'entrada/sortida a $BANC_FILE.
