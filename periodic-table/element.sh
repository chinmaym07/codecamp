#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c "

function print_element_info() {

    echo "The element with atomic number $1 is $2 ($3). It's a $5, with a mass of $7 amu. $2 has a melting point of $4 celsius and a boiling point of $6 celsius."
    #$ATOMIC_NUMBER - 1
    #$NAME - 2,
    #$SYMBOL - 3, 
    #$MELTING_POINT - 4, 
    #$TYPE - 5, 
    #$BOILING_POINT - 6
    #$ATOMIC_MASS - 7
}
function parse_print_info() {
  PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c "
  IFS='|'; read -ra strarr <<< "$1";
  ATOMIC_NUMBER=${strarr[0]};
  SYMBOL=${strarr[1]};
  NAME=${strarr[2]};
  IFS=' '
  ELEMENT_PROPERTIES=$($PSQL "select * from properties where atomic_number=$ATOMIC_NUMBER");
  IFS='|'; read -ra strarr2 <<< $ELEMENT_PROPERTIES;
  ATOMIC_MASS=${strarr2[1]}
  MELTING_POINT=${strarr2[2]}
  BOILING_POINT=${strarr2[3]}
  TYPE_ID=${strarr2[4]}
  IFS=' '
  TYPE_INFO=$($PSQL "select * from types where type_id=$TYPE_ID");
  IFS='|'; read -ra strarr3 <<< $TYPE_INFO;
  TYPE=${strarr3[1]}
  IFS=' '
  print_element_info $ATOMIC_NUMBER $NAME $SYMBOL $MELTING_POINT $TYPE $BOILING_POINT $ATOMIC_MASS
}

function not_found() {
  echo "I could not find that element in the database.";
}

if [[ $1 ]]
then
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER_PRESENT=$($PSQL "select * from elements where atomic_number=$1");
    if [[ $ATOMIC_NUMBER_PRESENT ]] 
    then
      parse_print_info $ATOMIC_NUMBER_PRESENT
    else
      not_found
    fi
    exit;
  fi
  len=`echo -n "$1"|wc -c`
  if [[ $len < 3 && $1 =~ ^[a-zA-Z]+$ ]]
  then
    SYMBOL_PRESENT=$($PSQL "select * from elements where symbol='$1'");
    if [[ $SYMBOL_PRESENT ]]
    then
      parse_print_info $SYMBOL_PRESENT
    else
      not_found
    fi
  fi
  if [[ $len > 2 ]]
  then
    NAME_PRESENT=$($PSQL "select * from elements where name='$1'");
    if [[ $NAME_PRESENT ]]
    then
      parse_print_info $NAME_PRESENT
    else
      not_found
    fi
  fi
else
  echo -e "Please provide an element as an argument.";
fi

