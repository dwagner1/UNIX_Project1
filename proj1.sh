#! /bin/bash

findRecord() {
	echo "findRecord() not implemented..."
}

addRecord() {
	#echo "addRecord() not implemented..."
	clear

	echo "Enter name: "
	read name

	echo "Enter address: "
	read address

	echo "Enter phone: "
	read phone

	echo "Enter email: "
	read email

	echo "$name,$address,$phone,$email" >> database.txt

	echo " --- Insert successful --- "
}

updateRecord() {
	echo "updateRecord() not implemented..."

}

removeRecord() {
	echo "removeRecord() not implemented..."

}

displayData() {
	echo "displayData() not implemented..."

}


echo " "
echo "Welcome to my contact database, please select the in the following menu: "
echo ""
#echo "Please note: your program MUST be compiled with -g flag"

while :
do
echo ""
echo "Select fromt the options below..."
echo "(a) Find a record"
echo "(b) Add a new record"
echo "(c) Update a record"
echo "(d) Remove a record"
echo "(e) Display the database"
echo "(f) Quit"
echo "> Selection is : "
read option

case $option in
	a)
		findRecord
	;;
	b)
		addRecord
	;;
	c)
		updateRecord
	;;
	d)
		removeRecord
	;;
	e)
		displayData
	;;
	f)
		echo "Stopping"
		exit;;
	*)
		echo "Invalid choice. "
esac
done