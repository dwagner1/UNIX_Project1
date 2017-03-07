#! /bin/bash

DATABASEFILE="database.txt"

findRecord() {
	echo "Enter the data to search for:"
	read searchData
	printf "%-20s%-20s%-20s%-20s\n" "Name" "Address" "Phone" "Email"
	while IFS= read -r line || [[ -n "$line" ]]; do
		if echo $line | grep -iq "$searchData"; then
            IFS=":"
            set -- $line
			for w in $@
			do
				printf "%-20s" $w
			done
			printf "\n"
    	fi
	done < database.txt         				
    
    echo ''
    IFS=' '
}


addRecord() {
	
	echo "Enter name: "
	read name

	echo "Enter address: "
	read address

	echo "Enter phone: "
	read phone

	echo "Enter email: "
	read email

    record=${name}${address}${phone}${email} 

    if echo ${record} | grep -s ":"; then
        echo "Invalid Record. Character "'":"'" not allowed in any record."
        return 1
    fi

    record="${name}:${address}:${phone}:${email}"

    echo "${record}" >> $DATABASEFILE
    echo " --- Insert successful --- "
}


updateRecord() {
        #SEARCH=''
	echo "Enter the record you would like to update: "
	read -r record
	numFound=0
	while [ ! ${numFound} -eq 1 ] ; do	
		#find the number of search results
		numFound=$(grep -ci "${record}" ${DATABASEFILE})

		#if multiple matches were found
		if [ ${numFound} -gt 1 ]; then
			grep -i "${record}" ${DATABASEFILE}
			echo ''
			echo "Error: Found multiple records. Cannot update."
                        echo "Try again with a more specific search."
			return 1;

		#no matches found
		elif [ ${numFound} -eq 0 ]; then
			echo ''
			echo "Error: Record Not Found!"
			return 1;
		else 
			#get line to be updated
			LINE=$(grep -in "${record}" ${DATABASEFILE})
			echo $LINE
			#split into fields using set
			IFS=':'
			set $LINE
                        lineno=$1
			name=$2
			address=$3
			phone=$4
			email=$5

		while [ ! "$INPUT" = "5" ] ; do
		echo ''
		echo "Which field would you like to update: "
		echo "1. Name"
		echo "2. Address"
		echo "3. Phone"
		echo "4. Email"
                echo "5. Done"
		read -r INPUT

		case "$INPUT" in
			"1" )
				echo "Enter new name:"
			read -r name
				;;
			"2" )
				echo "Enter new address:"
				read -r address
				;;
			"3" )
				echo "Enter new phone:"
				read -r phone
				;;
			"4" )
				echo "Enter new email:"
				read -r email
				;;
			"5" )
				INPUT="5"
				;;
			* )
				echo "Invalid Input"
		esac
        	done
		INPUT=''
		#Delete the original entry
		grep -v "${record}" ${DATABASEFILE} > temp && mv temp ${DATABASEFILE}

		#adds the updated entry to end of file
		echo "$name:$address:$phone:$email" >> ${DATABASEFILE}
		echo ''
		echo " --- Record has been updated! --- "
		numFound=1
		IFS=' '
	fi
	done
}

removeRecord() {
    echo "Enter the name of the record to be removed: "
    read -r remove
    #find matched line to be removed
    LINE=$(grep -inm 1 -e "${remove}" ${DATABASEFILE})
    if [ "$LINE" != "" ]; then
        numRecords=$(grep -ci "${remove}" ${DATABASEFILE})
    fi
    if [ $numRecords ] && [ $numRecords -gt 1 ]; then
        echo "Error: Found multiple records, nothing removed."
        grep -i "${remove}" ${DATABASEFILE}
        numRecords=''
    elif [ "$LINE" != "" ]; then
   	#delete line from the file
        grep -v "${remove}" ${DATABASEFILE} > temp && mv temp ${DATABASEFILE}
        echo " "
        echo " --- Record has been deleted! --- "

    else
        echo "Error: The record cannot be found."
    fi
}

displayData() {
        echo " "
	cat ${DATABASEFILE}
	echo " "
}


echo " "
echo "Welcome to my contact database, please select from the following menu: "
while :
do
echo ""
echo "Select from the options below..."
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
		echo "Exiting. Goodbye."
		exit;;
	*)
		echo "Invalid choice. "
esac
done
