curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":[
    { "name":"vttContent",    "type":"text_en", "stored":true },
    { "name":"vttPureText",   "type":"text_en", "stored":true },
    { "name":"courseId",      "type":"text_en", "stored":true },
    { "name":"lessonId",      "type":"text_en", "stored":true },
    { "name":"languageCode",  "type":"text_en", "stored":true },
    { "name":"lessonTitle",   "type":"text_en", "stored":true },
    { "name":"posterImage",   "type":"text_en", "stored":true },
    { "name":"alltext",       "type":"text_en", "stored":true, "multiValued":true }
  ],
  "add-copy-field":[
    { "source":"vttContent",  "dest":["alltext"] },   
    { "source":"vttPureText", "dest":["alltext"] },
    { "source":"courseId",    "dest":["alltext"] },
    { "source":"lessonId",   "dest":["alltext"] },
    { "source":"languageCode","dest":["alltext"] },
    { "source":"lessonTitle", "dest":["alltext"] },
    { "source":"posterImage", "dest":["alltext"] }
  ]
}' http://localhost:8983/solr/knowledgecity/schema