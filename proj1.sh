#! /bin/bash

echo " "
echo "Welcome to my contact database, please select the in the following menu: "
echo ""
#echo "Please note: your program MUST be compiled with -g flag"

while :
do
echo "(a) Find a record"
echo "(b) Add a new record"
echo "(c) Update a record"
echo "(d) Remove a record"
echo "(e) Quit"
echo "> Selection is : "
read option

case $option in
	a)
		echo "Find a record... Do something"
	;;
	b)
		echo "Add a new record... Do something"
	;;
	c)
		echo "Update an existing record... Do something"
	;;
	d)
		echo "Remove a record... Do something"
	;;
	e)
		echo "Stopping"
		exit;;
esac
done