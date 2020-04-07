#!/bin/bash
# this script makes compilation and save all the compilation's data into a log file.
# the script gets 2 parameters:
# parameter 1 - the name of the log file - for user choice.
# parameter 2 - the name of the program which the user would like to create.
# the currnet directory should contain this name.
gcc -Wall -o "$2" "$2.c" > "$1.log"
