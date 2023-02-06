#!/bin/bash
#Nom i cognoms de l'alumne: Rafael Tobías Miras
#Usuari de la UOC de l'alumne: rtobias
#Data: 15/12/2022
#Objectius de l'script: Generarem una nova columna per agrupar les edats de la columna "Date" per grups d'edat.
#Nom, tipus i nombre de línia o línies on es realitza la manipulació: edad (senser), nou camp: age_groups (text)

echo -e "\nInici de l'execució de l'script b.sh"
echo -e "----------------------------------------\n"

#Primerament eliminarem els fitxers que s'hagin pogut generar amb posterioritat
if [ -e shootings5.csv ]; 
	then
	  gio trash shootings5.csv
fi

#Eliminem fitxer creats amb l'anterior script b1.sh
if [ -e shootings4.csv ]; 
	then
	  gio trash shootings1.csv
	  gio trash shootings2.csv
	  gio trash shootings3.csv
fi


#Generem una columna nova agrupant les edats.
#Utilitzarem un bucle while per iterar l'arxiu i filtrarem per edats crean un fitxer de sortida que recollirà el mateix dataset però afegint-hi la columna 

{
read
while IFS=, read id name date manner_of_death armed age gender race city state signs_of_mental_illness threat_level flee body_camera arms_category
do
 if [[ $age -le 20 ]]; 
  then
   echo "Menor de 21,$id,$name,$date,$manner_of_death,$armed,$age,$gender,$race,$city,$state,$signs_of_mental_illness,$threat_level,$flee,$body_camera,$arms_category" >> shootings5.csv;
 elif [[ $age -gt 20 ]] && [[ $age -le 40 ]];
  then
   echo "De 21 a 40,$id,$name,$date,$manner_of_death,$armed,$age,$gender,$race,$city,$state,$signs_of_mental_illness,$threat_level,$flee,$body_camera,$arms_category" >> shootings5.csv;
 elif [[ $age -gt 40 ]] && [[ $age -le 60 ]];
  then
   echo "De 41 a 60,$id,$name,$date,$manner_of_death,$armed,$age,$gender,$race,$city,$state,$signs_of_mental_illness,$threat_level,$flee,$body_camera,$arms_category" >> shootings5.csv;
 elif [[ $age -gt 60 ]]
  then
   echo "Major de 60,$id,$name,$date,$manner_of_death,$armed,$age,$gender,$race,$city,$state,$signs_of_mental_illness,$threat_level,$flee,$body_camera,$arms_category" >> shootings5.csv;
 fi
done
} < $1



#Afegim la capçalera del nou dataset amb sed
sed -i '1 i \age_groups,id,name,date,manner_of_death,armed,age,gender,race,city,state,signs_of_mental_illness,threat_level,flee,body_camera,arms_category' shootings5.csv


echo -e "\n\nFinal de l'execució de l'script b.sh."
echo -e "----------------------------------------\n"

#Recursos:
#How to Compare Numbers in a Bash Script: https://linuxways.net/centos/compare-numbers-bash-script/

