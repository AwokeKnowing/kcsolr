#!/bin/bash
#usage: bash postlesson en BUS1000 003
bash cdnvtt2json.sh $1 $2 $3 |\
curl 'http://localhost:8983/solr/knowledgecity/update/json/docs?commitWithin=5000&split=/' -H 'Content-type:application/json' --data-binary @-