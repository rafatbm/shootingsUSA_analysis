#!/bin/bash
#Nom i cognoms de l'alumne: Rafael Tobias Miras
#Usuari de la UOC de l'alumne: rtobias
#Data: 14/01/2023

# Execució script a.sh.
./a.sh -v &

wait

# Execució script b1.sh
./b1.sh shootings.csv &

wait

# Executem script b.sh
./b.sh shootings4.csv &


wait

# Executem script b.awk
gawk -f b.awk shootings5.csv &

wait

# Executem script c.sh.
./c.sh shootings6.csv 
