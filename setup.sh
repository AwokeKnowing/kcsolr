#start docker solr instance
#docker run --name kcsolr -d -p 8983:8983 -t -v $HOME/solrdata:/opt/solr/solrdata solr

#create core (index)
#docker exec -it --user=solr kcsolr bin/solr create_core -c knowledgecity

#add vtt files as text files
#docker exec -it --user=solr my_solr bin/post -c gettingstarted  mydata/ -filetypes vtt -type text/plain


docker run --name kcsolr -d -p 8983:8983 solr solr-create -c knowledgecity