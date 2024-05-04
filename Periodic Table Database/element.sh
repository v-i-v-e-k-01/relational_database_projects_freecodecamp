#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table -c"
MAIN_PROGRAM() {
  if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  else
    PRINT_ELEMENT $1
  fi
}

PRINT_ELEMENT() {
    if [[ $1 =~ ^[1-9]+$ ]]
    then
      ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number='$1'")
    else
      ELEMENT=$($PSQL "SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, types.type FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id)  WHERE symbol='$1' OR name='$1'")
    fi
    if [[ -z $ELEMENT || $(echo "$ELEMENT" | wc -l) -eq 3 ]]
    then 
      echo "I could not find that element in the database."
    else
      echo "$ELEMENT" | awk 'NR>2{lines[NR]=$0} END{for(i=3;i<NR;i++) print lines[i]}' | while IFS=" |" read ANUMBER SYMBOL NAME AMASS MPC BPC TYPE
      do
        echo "The element with atomic number $ANUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $AMASS amu. $NAME has a melting point of $MPC celsius and a boiling point of $BPC celsius."
      done
    fi

}

MAIN_PROGRAM $1
