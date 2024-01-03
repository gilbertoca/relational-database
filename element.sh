#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"

#If you run ./element.sh 1, ./element.sh H, or ./element.sh Hydrogen, it should output only 
#"The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius."

if [[ $1 ]]
then
    #echo -e "\n$1"
    #read ATOMIC_NUMBER
    if [[ $1 =~ ^[0-9]+$ ]]
    then
        ELEMENT_RESULT=$($PSQL "select p.atomic_number number, e.name, e.symbol, t.type, p.atomic_mass mass, p.melting_point_celsius melt, p.boiling_point_celsius boil from properties p inner join elements e using(atomic_number) inner join types t using(type_id) where p.atomic_number = $1") 
    fi
    #read ELEMENT_SYMBOL
    
    SHORT=${#1}
    if [[ ! $1 =~ ^[0-9]+$ && ($SHORT -eq 1 || $SHORT -eq 2) ]]
    then
        ELEMENT_RESULT=$($PSQL "select p.atomic_number number, e.name, e.symbol, t.type, p.atomic_mass mass, p.melting_point_celsius melt, p.boiling_point_celsius boil from properties p inner join elements e using(atomic_number) inner join types t using(type_id) where e.symbol = '$1'")    
    fi    
    #read ELEMENT_NAME
    if [[ $SHORT -gt 2 ]]
    then
        ELEMENT_RESULT=$($PSQL "select p.atomic_number number, e.name, e.symbol, t.type, p.atomic_mass mass, p.melting_point_celsius melt, p.boiling_point_celsius boil from properties p inner join elements e using(atomic_number) inner join types t using(type_id) where e.name = '$1'")    
    fi
    if [[ -z $ELEMENT_RESULT ]]
    then
        echo -e "I could not find that element in the database."
    else
        arrIN=(${ELEMENT_RESULT//\|/ })
        #echo "$ELEMENT_RESULT" | read NUMBER NAME SYMBOL TYPE MASS MELT BOIL
        echo -e "The element with atomic number ${arrIN[0]} is ${arrIN[1]} (${arrIN[2]}). It's a ${arrIN[3]}, with a mass of ${arrIN[4]} amu. ${arrIN[1]} has a melting point of ${arrIN[5]} celsius and a boiling point of ${arrIN[6]} celsius."
                # The element with atomic number 1 is Hydrogen (H). It's a nonmetal, with a mass of 1.008 amu. Hydrogen has a melting point of -259.1 celsius and a boiling point of -252.9 celsius.
    fi
else
    echo -e "Please provide an element as an argument."
fi
