#!/bin/bash
#Nom i cognoms de l'alumne: Rafael Tobías Miras
#Usuari de la UOC de l'alumne: rtobias
#Data: 15/12/2022

echo -e "\nInici de l'execució de l'script a.sh"
echo -e "----------------------------------------\n"

#Guardem l'URL a path, i el nom del csv a file.
path="https://drive.google.com/file/d/1V_Kk0CKZ1zRa4QTffOM5oMXZsE3uG-X6/view?usp=sharing"
file="shootings.csv"


echo -e "Descarrega del fitxer shootings.csv\n"
wget --no-check-certificate 'https://drive.google.com/uc?export=download&id=1V_Kk0CKZ1zRa4QTffOM5oMXZsE3uG-X6' -O 'shootings.csv'


# Amb una sentencia condicional revisarem si existeix cap fitxer creat anteriorment per l'script. Si és així s'eliminaràn. 
if [ -e denuncies_20.csv ]; 
	then
	  gio trash shootings4.csv
	  gio trash shootings5.csv
	  gio trash shootings6.csv
	  gio trash resultats.html
fi


#Amb les comandes head, tail i sed calcularem el total de columnes i files que té l'arxiu.
columnes=$(head -1 $file | sed 's/[^,]//g' | wc -c)
registres=$(tail -n+2 $file | wc -l)


#Si l'script s'executa sense opcions, mostra la URL de descàrrega i el nombre de columnes i registres
if [ -z "$1" ]; 
	then
	 echo -e "\n\nURL de descàrrega: "$path
	 echo -e "Nombre de columnes: "$columnes 
	 echo -e "Nombre de registres: "$registres  
#En canvi, si s'inclou en la seva invocació l'opció -v mostrará, a més el format del fitxer i el tipus de dades de les seves columnes.	 
else
	echo -e "URL de descàrrega: "$path
	echo -e "Format del fitxer: "${file##*.}
	echo -e "Nombre de columnes: "$columnes
	echo -e "Nombre de registres: "$registres
	echo -e "Tipus de dades per columna:\n"
	csvstat --type $file

fi
echo -e "\n\nFinal de l'execució de l'script a.sh."
echo -e "----------------------------------------\n"




#Recursos:

#CSVSTAT: https://csvkit.readthedocs.io/en/1.0.2/scripts/csvstat.html
#Extract filename and extension in Bash: https://stackoverflow.com/questions/965053/extract-filename-and-extension-in-bash
#Make `rm` move to trash: https://unix.stackexchange.com/questions/42757/make-rm-move-to-trash
