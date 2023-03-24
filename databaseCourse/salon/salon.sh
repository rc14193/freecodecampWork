#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"
echo -e "\nWelcome to My Salon, how can I help you?\n"

SERVICES(){
SERVICES=$($PSQL "SELECT * FROM services")

if [[ -n $1 ]]
then
	echo -e "\n$1"
fi

echo "$SERVICES" | while IFS="|" read SERVICE_ID NAME
do
	SERVICE_ID=$(echo $SERVICE_ID | sed 's/ //g')
	echo "$SERVICE_ID)$NAME"
done

read SERVICE_ID_SELECTED
if ! [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
then
	SERVICES "I could not find that service. What would you like today?" 
fi

SERVICE_ID=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

if [[ -z $SERVICE_ID ]]
then
	SERVICES "I could not find that service. What would you like today?" 
else
	echo -e "\nPlease enter your phone number."
	read CUSTOMER_PHONE
	CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
	if [[ -z $CUSTOMER_NAME ]]
	then
		echo -e "\nWelcome new customer. Please enter your name: "
		read CUSTOMER_NAME
		ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
	fi
	echo -e "\nPlease enter a time for your appointment: "
	read SERVICE_TIME
	CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
	INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES('$CUSTOMER_ID',$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
fi
SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")

echo -e "I have put you down for a$SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
exit

}

SERVICES

