#!/bin/bash
#Nom i cognoms de l'alumne: Rafael Tobías Miras
#Usuari de la UOC de l'alumne: rtobias
#Data: 14/01/2023
#Objectiu: Mostrar un anàlisi, en un fitxer HTML, del fitxer descarregat de Kaggle sobre trets occurreguts als EUA entre el 2015 i el 2020. 
#Nom i tipus dels camps d'entrada: year (enter), age_groups (text), id (enter), name (text), date (data), manner_of_death (text), armed (text), age (enter), gender (text), race (text), city (text), state (text), signs_of_mental_illnes (text), treat_leave (text), flee (text), body_camera (bolean), arms_category (text)
#Operacions i núm. línia o línies on es realitzen: S'han extret percentatges i agrupacions per sexe, any i raça.
#Nom i tipus de els nou camps generats: % Home (float), % Dona (float)


echo -e "\nInici de l'execució de l'script c.sh"
echo -e "----------------------------------------\n"


#Iniciem la redacció del codi HTML.
(


echo "<center><font size=10>Anàlisi dels trets efectuats per la policia contra homes i dones als EUA.</font></center><br/>"

#Comptem la quantitat de dones i d'homes per any. Obrirem també el còdi HTML.
#Taula 1
awk 'BEGIN {
FS=","
print "<HTML><BODY>"
male2015=0
male2016=0
male2017=0
male2018=0
male2019=0
male2020=0
female2015=0
female2016=0
female2017=0
female2018=0
female2019=0
female2020=0
print "<p></p><br/>"
print "<center><TABLE border=\"1\"></center>"
print "<TR><TH colspan="4">Evolució dels trets per any i sexe</TR></TH>"
print "<TR><TH>Sexe</TH><TH>2015</TH><TH>2016</TH><TH>2017</TH><TH>2018</TH><TH>2019</TH><TH>2020</TR></TH>"
}


{if (NR!=1 && $1==2015 && $9=="Male"){male2015+=1}}
{if (NR!=1 && $1==2016 && $9=="Male"){male2016+=1}}
{if (NR!=1 && $1==2017 && $9=="Male"){male2017+=1}}
{if (NR!=1 && $1==2018 && $9=="Male"){male2018+=1}}
{if (NR!=1 && $1==2019 && $9=="Male"){male2019+=1}}
{if (NR!=1 && $1==2020 && $9=="Male"){male2020+=1}}
{if (NR!=1 && $1==2015 && $9=="Female"){female2015+=1}}
{if (NR!=1 && $1==2016 && $9=="Female"){female2016+=1}}
{if (NR!=1 && $1==2017 && $9=="Female"){female2017+=1}}
{if (NR!=1 && $1==2018 && $9=="Female"){female2018+=1}}
{if (NR!=1 && $1==2019 && $9=="Female"){female2019+=1}}
{if (NR!=1 && $1==2020 && $9=="Female"){female2020+=1}}


END{

printf "<TR><TD>Home</TD><TD>%d</TD><TD>%d</TD><TD>%d</TD><TD>%d</TD><TD>%d</TD><TD>%d</TR></TH>", male2015, male2016, male2017, male2018, male2019, male2020
printf "<TR><TD>Dona</TD><TD>%d</TD><TD>%d</TD><TD>%d</TD><TD>%d</TD><TD>%d</TD><TD>%d</TR></TH>", female2015, female2016, female2017, female2018, female2019, female2020
print "</TABLE>"
print "<center><p>Taula 1: Evolució dels trets per sexes entre 2015 i 2020</p><br/><center>"

}' $1


echo "<center><p>En aquesta primera taula podem observar el nombre de trets fets per la policia rebuts per homes i dones per any. Es poden observar dues coses:
Per una banda reben més trets els homes que les dones. D'altra banda observem que les dades es mostren constant pels dos sexes fins 2020. El 2020 es veu un decreixement significatiu que coincideix amb l'any en que esclata la pandèmia de COVID-19 i es produeixen confinaments a nivell mundial.</p><br/><center>"

#Comptem la quantitat de dones i homes per rangs d'edat.
#Taula 2
awk 'BEGIN {
FS=","
male_1=0
male_2=0
male_3=0
male_4=0
female_1=0
female_2=0
female_3=0
female_4=0
print "<p></p><br/>"
print "<center><TABLE border=\"1\"></center>"
print "<TR><TH colspan="4">Trets per franja edat i sexe</TR></TH>"
print "<TR><TH>Rang edat</TH><TH>Home</TH><TH>Dona</TR></TH>"
}

{if (NR!=1 && $2=="Menor de 21" && $9=="Male"){male_1+=1}}
{if (NR!=1 && $2=="De 21 a 40" && $9=="Male"){male_2+=1}}
{if (NR!=1 && $2=="De 41 a 60" && $9=="Male"){male_3+=1}}
{if (NR!=1 && $2=="Major de 60" && $9=="Male"){male_4+=1}}
{if (NR!=1 && $2=="Menor de 21" && $9=="Female"){female_1+=1}}
{if (NR!=1 && $2=="De 21 a 40" && $9=="Female"){female_2+=1}}
{if (NR!=1 && $2=="De 41 a 60" && $9=="Female"){female_3+=1}}
{if (NR!=1 && $2=="Major de 60" && $9=="Female"){female_4+=1}}



END{

printf "<TR><TD>Menor de 21</TD><TD>%d</TD><TD>%d</TR></TH>", male_1, female_1
printf "<TR><TD>De 21 a 40</TD><TD>%d</TD><TD>%d</TR></TH>", male_2, female_2
printf "<TR><TD>De 41 a 60</TD><TD>%d</TD><TD>%d</TR></TH>", male_3, female_3
printf "<TR><TD>Major de 60</TD><TD>%d</TD><TD>%d</TR></TH>", male_4, female_4
printf "<TR><TD>Total</TD><TD>%d</TD><TD>%d</TR></TH>", male_1+male_2+male_3+male_4, female_1+female_2+female_3+female_4
print "</TABLE>"
print "<center><p>Taula 2: Trets rebuts per homes i dones en el període 2015-2020.</p><br/><center>"

}' $1

echo "<center><p>A la segona taula se'ns mostra el nombre de trets rebuts per homes i dones en total en el període 2015-2020. S'observa que la majoria de persones tirotejades han sigut en la franja de 21 a 40 anys. És el que podiem esperar ja que la lógica ens porta a pensar que la majoria de delinqüents estiguin dins d'aquesta edat.</p><br/><center>"

#Comptem la quantitat d'homes i dones per raça. Calcularem el percentatge sobre el total d'homes i dones per poder veure més facilment a quina raça se li ha disparat més
#Taula 3
awk 'BEGIN {
FS=","
male_1=0
male_2=0
male_3=0
male_4=0
female_1=0
female_2=0
female_3=0
female_4=0
print "<p></p><br/>"
print "<center><TABLE border=\"1\"></center>"
print "<TR><TH colspan="4">Trets per sexe i raça</TR></TH>"
print "<TR><TH>Raça</TH><TH>Home</TH><TH>% Home</TH><TH>Dona</TH><TH>% Dona</TR></TH>"
}

{if (NR!=1 &&$9=="Male" && $10=="Asian"){asian_m+=1}}
{if (NR!=1 &&$9=="Male" && $10=="Black"){black_m+=1}}
{if (NR!=1 &&$9=="Male" && $10=="Hispanic"){hispanic_m+=1}}
{if (NR!=1 &&$9=="Male" && $10=="Native"){native_m+=1}}
{if (NR!=1 &&$9=="Male" && $10=="Other"){other_m+=1}}
{if (NR!=1 &&$9=="Male" && $10=="White"){white_m+=1}}

{if (NR!=1 &&$9=="Female" && $10=="Asian"){asian_f+=1}}
{if (NR!=1 &&$9=="Female" && $10=="Black"){black_f+=1}}
{if (NR!=1 &&$9=="Female" && $10=="Hispanic"){hispanic_f+=1}}
{if (NR!=1 &&$9=="Female" && $10=="Native"){native_f+=1}}
{if (NR!=1 &&$9=="Female" && $10=="Other"){other_f+=1}}
{if (NR!=1 &&$9=="Female" && $10=="White"){white_f+=1}}



END{

total_race_m = asian_m+black_m+hispanic_m+native_m+other_m+white_m
total_race_f = asian_f+black_f+hispanic_f+native_f+other_m+white_f


p_asian_m = (asian_m/total_race_m)*100
p_black_m = (black_m/total_race_m)*100
p_hispanic_m = (hispanic_m/total_race_m)*100
p_native_m = (native_m/total_race_m)*100
p_other_m = (other_m/total_race_m)*100
p_white_m = (white_m/total_race_m)*100
p_total_m = (total_race_m/total_race_m)*100


p_asian_f = (asian_f/total_race_f)*100
p_black_f = (black_f/total_race_f)*100
p_hispanic_f = (hispanic_f/total_race_f)*100
p_native_f = (native_f/total_race_f)*100
p_other_f = (other_f/total_race_f)*100
p_white_f = (white_f/total_race_f)*100
p_total_f = (total_race_f/total_race_f)*100


printf "<TR><TD>Asiatic</TD><TD>%d</TD><TD>%.2f</TD><TD>%d</TD><TD>%.2f</TR></TH>", asian_m, p_asian_m, asian_f, p_asian_f
printf "<TR><TD>Negre</TD><TD>%d</TD><TD>%.2f</TD><TD>%d</TD><TD>%.2f</TR></TH>", black_m, p_black_m, black_f, p_black_f
printf "<TR><TD>Hispà</TD><TD>%d</TD><TD>%.2f</TD><TD>%d</TD><TD>%.2f</TR></TH>", hispanic_m, p_hispanic_m, hispanic_f, p_hispanic_f
printf "<TR><TD>Nadiu</TD><TD>%d</TD><TD>%.2f</TD><TD>%d</TD><TD>%.2f</TR></TH>", native_m, p_native_m, native_f, p_native_f
printf "<TR><TD>Altre</TD><TD>%d</TD><TD>%.2f</TD><TD>%d</TD><TD>%.2f</TR></TH>", other_m, p_other_m, other_f, p_other_f
printf "<TR><TD>Blanc</TD><TD>%d</TD><TD>%.2f</TD><TD>%d</TD><TD>%.2f</TR></TH>", white_m, p_white_m, white_f, p_white_f
printf "<TR><TD>total</TD><TD>%d</TD><TD>%.2f</TD><TD>%d</TD><TD>%.2f</TR></TH>", total_race_m, p_total_m, total_race_f, p_total_f
print "</TABLE>"
print "<center><p>Taula 3: Trets rebuts per sexe i raça en el període 2015-2020.</p><br/><center>"

}' $1

echo "<center><p>L'anàlisi d'aquesta taula ens mostra que la majoria de persones tirotejades tant homes com dones son les de raça blanca, superant el 50% en tots dos casos. Aquest cas ens ha de sobtar ja que la percepció que podem tenir, per les noticies que ens arriben, es que la majoria d'incidents es son amb persones de raça negre. Un exercici interesant seria veure si alguna d'aquestes persones ha mort. Malauradament aquest dataset no ens mostra aquesta dada.</p><br/><center>"

#Tanquem el fitxer HTML
printf "</BODY></HTML>"

) > resultats.html


echo -e "\n\nFinal de l'execució de l'script c.sh."
echo -e "----------------------------------------\n"





