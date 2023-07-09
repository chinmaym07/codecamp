#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c "

SELECT_SERVICE(){
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SERVICE_MENU "Please provide valid service number"
  else
    SERVICE_PRESENT=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED;")
    if [[ -z $SERVICE_PRESENT ]]
    then
      SERVICE_MENU "I could not find that service. What would you like today?"
    else
      echo -e "What's your phone number?"
      read CUSTOMER_PHONE 
      CUSTOMER_PRESENT=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
      if [[ -z $CUSTOMER_PRESENT ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        CUSTOMER_ADDED=$($PSQL "Insert into customers(phone, name) values('$CUSTOMER_PHONE', '$CUSTOMER_NAME')") 
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE';")
        SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED;")
        echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME"
        read SERVICE_TIME
        APPOINTMENT_STATUS=$($PSQL "Insert into appointments(customer_id, service_id, time) values($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')");
        if [[ $APPOINTMENT_STATUS ]]
        then
          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
        fi
      else
        CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE';")
        SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED;")
        echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME"
        read SERVICE_TIME
        APPOINTMENT_STATUS=$($PSQL "Insert into appointments(customer_id, service_id, time) values($CUSTOMER_PRESENT, $SERVICE_ID_SELECTED, '$SERVICE_TIME')");
        if [[ $APPOINTMENT_STATUS ]]
        then
          echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
        fi
      fi
    fi
  fi
}

SERVICE_MENU() {
  if [[ $1 ]]
  then 
    echo -e "\n$1"
  fi
  #echo -e "\nList of Service offered"
  SERVICES_LIST=$($PSQL "select service_id, name from services;")
  if [[ -z $SERVICES_LIST ]]
  then
    echo -e "\nNo Services are provided"
  else
    echo "$SERVICES_LIST" | while read SERVICE_ID BAR NAME
    do
      echo "$SERVICE_ID) $NAME"    
    done
  fi
  #echo -e "\nHow may I help you ?"
  SELECT_SERVICE
}

echo -e "\n~~~~~ MY SALON ~~~~~"
echo -e "\nWelcome to My Salon, how can I help you?"
SERVICE_MENU
