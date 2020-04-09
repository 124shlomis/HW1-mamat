#!/bin/bash
# this script compare between the ouput of a given program with desired output file
# parameter 1 - user choice for log file for the output
# parameter 2 - name of the program to check
# parameter 3 - name of the input file
# parameter 4 - name of the desired output file
./$2 $3 > "$1.log"
if [[ $(diff "$1.log" $4) = "" ]]; then
	echo "Out files match"
	exit 0
elif [[ $(diff "$1.log" $4) != "" ]]; then
	echo "Out files mismatch"
	exit 1
fi