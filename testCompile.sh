#!/bin/bash
# this script makes compilation and save all the compilation data into a log file.
# the script gets 2 parameters:
# parameter 1 - the name of the log file - for user choice.
# parameter 2 - the name of the program which the user would like to create.
gcc -Wall -o "$2" "$2.c" &> "$1.log"
if [ $(grep -c "$2.c" $1.log) -ne 0 ]
then
    echo "Compile failed"
    exit 1
else
	echo "Compile succeeded"
	exit 0
fi