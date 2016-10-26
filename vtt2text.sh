#!/bin/bash
#usage: cat file.vtt | bash vtt2text.sh
#returns: all text without timing on single line
sed 's/\r$//'                          |\
grep -E -v -- "-->|^$|^[0-9]+$|WEBVTT" |\
tr '\n' ' '                            |\
tr -s ' '                              |\
tr -d '\t'                             |\
sed 's/\\/\\\\/g'                      |\
sed 's/"/\\"/g' 
