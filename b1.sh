#!/bin/bash
#Nom i cognoms de l'alumne: Rafael Tobias Miras
#Usuari de la UOC de l'alumne: rtobias
#Data: 21/12/2022
#Objectius de l'script:
# -Modificar els valors de la variable "Gender" per "Male" i "Female".
# -Eliminar valors de la variable "age" que no siguin coherents.
# -Conversió a valor númeric de la columna "age"

#Nom, tipus i nombre de línia o línies on es realitza la manipulació:
# -Es modifiquen tots els registres "F" i "M" de la variable "gender" pels valors "Female" i "Male". La variable seguirà sent del tipus String.
# -S'eliminen tots valors numerics de la variable "age" que no siguin coherents amb la resta, és a dir, no tinguin l'estructura XX.0
# -Modificació dels valors numerics de la variable "age" de la forma XX.0 a la forma XX


echo -e "\nInici de l'execució de l'script b1.sh"
echo -e "----------------------------------------\n"


#Modifiquem els valors F i M del camp gender per Female i Male respectivament amb la comanda sed
sed 's/,F,/,Female,/g' shootings.csv > shootings1.csv
sed 's/,M,/,Male,/g' shootings1.csv > shootings2.csv

#Eliminarem aquells valors en la columna "age" que no segueixin l'esquema XX.0.
sed '/.*,[[:digit:]]\+\.[[:digit:]]\+[^0],.*/d' shootings2.csv > shootings3.csv

#Eliminem els caracters ".0" de la columna "age".
sed 's/\.0//g' shootings3.csv > shootings4.csv


#Revisem que el nou fitxer csv que hem generat no contingui valors buits.
errors=$(tail -n +2 shootings4.csv | grep -E ",,|, ," | wc -l)
linia=$(tail -n +2 shootings4.csv | grep -E ",,|, ,")


#Si es detecta cap error comptarem el número.
if [ $errors -gt 0 ];
then
 echo "S'ha detectat el següent número d'errors: $errors"
 echo "Els errors s'han detectat a les següents línies: $linia" 
fi


echo -e "\n\nFinal de l'execució de l'script b1.sh."
echo -e "----------------------------------------\n"
