#!/bin/bash
courseid=$1
totallessons=$2
for (( c=0; c<$totallessons; c++ ))
do  
   p='en '$(printf "$courseid %03d\n" "$c")
   echo $p
   bash postlesson.sh $p
done