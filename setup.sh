#start docker solr instance
#docker run --name kcsolr -d -p 8983:8983 -t -v $HOME/solrdata:/opt/solr/solrdata solr

#create core (index) 
#docker exec -it --user=solr kcsolr bin/solr create_core -c knowledgecity

#add vtt files as text files
#docker exec -it --user=solr my_solr bin/post -c gettingstarted  mydata/ -filetypes vtt -type text/plain
echo
echo "--------------------------------------------------"
echo "Stopping / removing any previous instance"
docker stop kcsolr
docker rm -v kcsolr
echo
echo "Starting solr docker image with core: knowledgecity"
docker run --name kcsolr -d -p 8983:8983 solr solr-create -c knowledgecity
echo


printf "Waiting for solr"
until $(curl --output /dev/null --silent --head --fail http://localhost:8983); do
    printf '.'
    sleep 3
done

echo
printf "Waiting for core: knowledgecity"
until [[ $(curl -sS http://localhost:8983/solr/admin/cores?action=STATUS) =~ knowledgecity ]]; do
    printf '.'
    sleep 1
done	
echo


echo "Adding lessons schema"
bash addschema-lessons.sh
echo 
echo "Indexing test data"
bash test-lessons.sh
echo
echo "Setup complete!"
echo "--------------------------------------------------"
