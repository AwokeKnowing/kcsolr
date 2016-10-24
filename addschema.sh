curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":[
    { "name":"first",  "type":"text_en", "stored":true },
    { "name":"last",   "type":"text_en", "stored":true },
    { "name":"grade",  "type":"text_en", "stored":true },
    { "name":"subject","type":"text_en", "stored":true },
    { "name":"test",   "type":"text_en", "stored":true },
    { "name":"marks",  "type":"text_en", "stored":true },
    { "name":"alltext","type":"text_en", "stored":true, "multiValued":true }
  ],
  "add-copy-field":[
    { "source":"first",  "dest":["alltext"] },   
    { "source":"last",   "dest":["alltext"] },
    { "source":"subject","dest":["alltext"] },
    { "source":"test",   "dest":["alltext"] },
    { "source":"grade",  "dest":["alltext"] },
    { "source":"marks",  "dest":["alltext"] }
  ]
}' http://localhost:8983/solr/knowledgecity/schema