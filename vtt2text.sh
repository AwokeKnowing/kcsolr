#!/bin/bash
fname=$1
#sed 's/\r$//' "$fname" | awk -vRS= -vORS= -F'\n' '{for (i=3;i<=NF;i++) print $i} END {print "\n"}' 
sed 's/\r$//' "$fname"    |\
grep -v -- "-->"          |\
grep -v "^$"              |\
grep -E -v "^[0-9]+$"     |\
sed 's/WEBVTT//'          |\
tr '\n' ' '               |\
tr -s ' '                 |\
tr -d '\t'                |\
sed 's/\\/\\\\/g'         |\
sed 's/"/\\"/g' 
