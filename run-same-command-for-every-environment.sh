#!/bin/bash

# Creating a Map of Environments
declare -A environments=( ["DEV"]="192.168.1.x:8080" ["TEST"]="10.x.x.x" ["STG"]="10.x.x.x" ["PROD"]="10.x.x.x")

alias java7="/usr/lib/jvm/java-7-oracle/jre/bin/java"

# Checking parameters
if [ "$#" -ne 3 ]; then
    echo "Illegal number of parameters. Expected 1) ??? 2) ??? 3) File name."
else
    echo ""
    echo "*** Starting... ***"
    echo ""
    java7 -version
    echo ""

    # Checking if the file exists (3rd parameter)
    if [ -f "$3" ]; then
	# 'env' is the name of the environment. i.e.: DEV
	for env in "${!environments[@]}"
	# Running the same COMMAND for every environment
    	do
	    # 'address' is the current address of the environment. i.e.: 192.168.1.x:8080
	    address=${environments["$env"]}
	    echo "$env: $address"
	    # Run the COMMAND and assign the result to a variable
	    result=$(java7 -cp /path/to/file.jar com.gvolpe.example.MainClass $1 $address $2 $3)
	    # Convert the result to an array.
	    array_result=($result)
	    # Expected result[0]: File name created. i.e.: generated-script.sh
	    file=${array_result[0]}
	    # Splitting the file name by '.'. Expected for i.e.: generated-script
	    clean_name=`echo $file | cut -d'.' -f 1`
	    # Creating a new file name using the environment name. i.e.: generated-script-DEV.sh
	    new_file=$clean_name"-"$env".sh"
	    echo "GENERATED: $new_file"
	    # Renaming generated-script.sh to generated-script-DEV.sh
	    mv $file $new_file
	done
    else
	echo "Invalid file: $3. It doesn't exists."
    fi
fi
