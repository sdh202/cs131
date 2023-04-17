#!/bin/bash

#Check for 2 Parameters
if [[ $# -ne 2 ]]; then
	echo "Error: Usage is $0 x fileinput"
	exit 1
fi

#Parameters:
x=$1
fileinput=$2

#Check if x is between 1 and 99
if [[ $x -gt 99 || $x -lt 1 ]]; then
	echo "Error: x needs to be an integer between 1 and 99"
	exit 1
fi

#Get line count in fileinput parameter
lc=$(wc -l < "$fileinput")

#Determine number of lines to randomly sample
sample_lc=$((lc * x / 100))

#Generate and get the determined number of random lines
for ((i=0; i<$sample_lc; i++)); do
#Generate a random line number between 1 and total number of lines	
	rand_linenum=$((RANDOM % lc + 1))
#Get the corresponding line
	sed -n "${rand_linenum}p" "$fileinput"
done
