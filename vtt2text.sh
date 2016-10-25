#!/bin/bash

fname=$1
sed 's/\r$//' "$fname" | awk -vRS= -vORS= -F'\n' '{for (i=3;i<=NF;i++) print $i} END {print "\n"}'
