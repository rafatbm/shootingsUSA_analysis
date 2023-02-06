#! /usr/bin/awk -f
#Nom i cognoms de l'alumne: Rafael Tobías Miras
#Usuari de la UOC de l'alumne: rtobias
#Data: 21/12/2022
#Objectius de l'script: Crear una nova columna amb la variable any a partir de la columna "Date"
#Nom, tipus i nombre de línia o línies on es realitza la manipulació: Es realitzará la manipulació en totes les línies. La columna "Date" és de tipus "Date" i la nova columna passará a ser tipus número.


END{
{print "Inici de l'execució de l'script b.awk"}
{print "----------------------------------------"}
{print ""}
}

# Modifiquem el format de les dates amb awk. Utilitzem a FPAT un regex per separar correctament els camps ja que en alguns registres, la variable "name" conté una coma 
BEGIN {
FPAT="(\"[^\"]+\")|([^,]+)"
}
#Separem la variable "date" pel caracter "-", que és el separador d'any, més i dia, i ho guardem a la nova variable "year_u".
{split($4,year_u,"-")}

#Guardem les columnes i la nova columna year, que conté l'any.
{if (NR){
	age_groups[NR-2]= $1
	id[NR-2]= $2
	name[NR-2]= $3
	date[NR-2]= $4
	manner_of_death[NR-2]= $5
	armed[NR-2]= $6
	age[NR-2]= $7
	gender[NR-2]= $8
	race[NR-2]= $9
	city[NR-2]= $10
	state[NR-2]= $11
	signs_of_mental_illness[NR-2]= $12
	threat_level[NR-2]= $13
	flee[NR-2]= $14
	body_camera[NR-2]= $15
	arms_category[NR-2]= $16
	year[NR-2]= year_u[1]
	}
}
END{ #Generem la capçalera del nou dataset que anomenarem shootings6.csv
	{print "year,age_groups,id,name,date,manner_of_death,armed,age,gender,race,city,state,signs_of_mental_illness,threat_level,flee,body_camera,arms_category" > "shootings6.csv"}

	for (i=0;i<NR;i++){
		{print year[i]","age_groups[i]","id[i]","name[i]","date[i]","manner_of_death[i]","armed[i]","age[i]","gender[i]","race[i]","city[i]","state[i]","signs_of_mental_illness[i]","threat_level[i]","flee[i]","body_camera[i]","arms_category[i] >> "shootings6.csv"}
	} 
	

{print "Final de l'execució de l'script b.awk."}
{print "----------------------------------------"}
}
