#!/bin/bash
#usage: vtt2text.sh file.vtt
#returns: all text without timing on single line
sed 's/\r$//' "$1"                     |\
grep -E -v -- "-->|^$|^[0-9]+$|WEBVTT" |\
tr '\n' ' '                            |\
tr -s ' '                              |\
tr -d '\t'                             |\
sed 's/\\/\\\\/g'                      |\
sed 's/"/\\"/g' 
