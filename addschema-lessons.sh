curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":[
    { "name": "vttPureText",       "type": "text_en", "stored": true },
    { "name": "courseId",          "type": "text_en", "stored": true },
    { "name": "lessonId",          "type": "text_en", "stored": true },
    { "name": "languageCode",      "type": "text_en", "stored": true },
    { "name": "lessonTitle",       "type": "text_en", "stored": true },
    { "name": "posterImage",       "type": "text_en", "stored": true },
    { "name": "allSearchText",     "type": "text_en", "stored": true, "multiValued": true }
  ],
  "add-copy-field":[
    { "source": "vttPureText",     "dest": ["allSearchText"] },
    { "source": "courseId",        "dest": ["allSearchText"] },
    { "source": "lessonId",        "dest": ["allSearchText"] },
    { "source": "lessonTitle",     "dest": ["allSearchText"] }
  ]
}' http://localhost:8983/solr/knowledgecity/schema