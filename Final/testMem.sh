#!/bin/bash

# 1st parameter: name of log file
# 2nd parameter: name of program
# 3rd parameter: name of input file

# this script checks if the input program 
# causes memory leaks or illegal access to memory 

valgrind --tool=memcheck ./"$2" < "$3" 2> "$1" > /dev/null

er1=`grep "ERROR SUMMARY: 0 errors from 0 contexts" "$1"` 2> /dev/null
er2=`grep "LEAK SUMMARY:" "$1"` 2> /dev/null

if [ "$er1"=="ERROR SUMMARY: 0 errors from 0 contexts" ] && [ -z "$er2" ] 
then
	echo "Memory test passed"
	exit 0
else
	echo "Memory test failed"
	exit 1
fi