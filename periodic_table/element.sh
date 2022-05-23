#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
if [[ -z $1 ]] 
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    # it's a number
    ELEMENT_INFO=$($PSQL "SELECT name, symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number=$1")
    if [[ -z $ELEMENT_INFO ]]
    then
      echo "I could not find that element in the database."
    else
      read NAME BAR SYMBOL BAR TYPE BAR MASS BAR MELTING BAR BOILING <  <(echo $ELEMENT_INFO)
      echo "The element with atomic number $1 is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
  elif [[ ${1,,} =~ ^[a-z]$ || ${1,,} =~ ^[a-z][a-z]$ ]]
  then
    # it's an element symbol
    ELEMENT_INFO=$($PSQL "SELECT name, elements.atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE symbol='$1'")
    if [[ -z $ELEMENT_INFO ]]
    then
      echo "I could not find that element in the database."
    else
      read NAME BAR NUMBER BAR TYPE BAR MASS BAR MELTING BAR BOILING <  <(echo $ELEMENT_INFO)
      echo "The element with atomic number $NUMBER is $NAME ($1). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
  elif [[ ${1,,} =~ ^[a-z][a-z][a-z]+$ ]]
  then
    # it's an element name
    ELEMENT_INFO=$($PSQL "SELECT symbol, elements.atomic_number, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE name='$1'")
    if [[ -z $ELEMENT_INFO ]]
    then
      echo "I could not find that element in the database."
    else
      read SYMBOL BAR NUMBER BAR TYPE BAR MASS BAR MELTING BAR BOILING <  <(echo $ELEMENT_INFO)
      echo "The element with atomic number $NUMBER is $1 ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $1 has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
    fi
  else
    echo "Invalid"
  fi
fi
