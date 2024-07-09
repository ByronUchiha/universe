#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

SERVICE_MENU(){
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  echo -e "Welcome to Pepe's Salon, how can I help you?\n"
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done 
  read SERVICE_ID_SELECTED

  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$  ]]
  then 
    SERVICE_MENU "I could not find that service. What would you like today?"
  fi
  
  SERVICE_ID_RESULT=$($PSQL "SELECT * FROM services WHERE service_id=$SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID_RESULT ]]
  then 
    SERVICE_MENU "I could not find that service. What would you like today?"
  else
    return $SERVICE_ID_SELECTED
  fi
}

USER_VALIDATION(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    INSERT_USER=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    if [[ $INSERT_USER='INSERT 0 1' ]]
    then
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    fi
  fi
  return $CUSTOMER_ID
}

GET_APPOINTMENT(){
  echo -e "\nWhat time would you like your cut, $2?"
  read SERVICE_TIME
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($3, $1, '$SERVICE_TIME')")
  if [[ $INSERT_APPOINTMENT = 'INSERT 0 1' ]]
  then
    echo -e "\nI have put you down for a $4 at $SERVICE_TIME, $2."
  fi
}

echo -e "\n~~ Pepe' salon ~~\n"
SERVICE_MENU
SERVICE_ID=$?
SERVICE=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID'")
USER_VALIDATION
CUSTOMER_ID=$?
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id='$CUSTOMER_ID'")
GET_APPOINTMENT $CUSTOMER_ID $CUSTOMER_NAME $SERVICE_ID $SERVICE  





