#!/bin/bash
# this script gets a list of checks. Firstly, its checking if there is a dirctiry 
# named "logFiles". If there is - it prints Failure message and exit the program.
# If there is no dirctory - it will create it.
# The script prints the number of the line and the description of the checking.
# the script need to run all the 3 checkings: Comilation, input/output and memory.
# In the end of all the checks. it will print the number of the successed checks.
# and sum of all the checks.
# parameter 1 - list of checks
DIR="./logFiles"
if [[  -d "$DIR" ]]; then
	echo "logFiles directory already exists!"
	exit 1
elif [[ ! -d "$DIR" ]]; then
		mkdir $DIR
fi
((lines_number=`cat $1 | wc -l`))
((line_counter=1))
((success_counter=0))
while read -r line; do
	if [[ $line == "" ]];then
		continue
	fi
	IFS='@' 
	read -r -a splited_line  <<< "$line"
	description=${splited_line[0]}
	program=${splited_line[1]}
	input=${splited_line[2]}
	output_to_compare=${splited_line[3]}
	echo "$line_counter: $description"
	if ( ./testCompile.sh "logFiles/$line_counter.compile" $program ); then
		((success_counter++))
	fi
	if ( ./testInOut.sh "logFiles/$line_counter.inout" $program $input $output_to_compare ); then
		((success_counter++))
	fi 
	if (./testMem.sh "logFiles/$line_counter.memory" $program $input); then
		((success_counter++))
	fi
	((line_counter++))
done < $1
echo $success_counter tests passed out from $((line_counter*3-3))