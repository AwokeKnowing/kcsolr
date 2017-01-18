# kcsolr
Solr / Lucene (on Docker) search for VTT files

## Setup
On a fresh install of ubuntu, with docker installed, you just run the following and you'll have a running solr instance with knowledgecity search schema and all the courses.
```
bash setup.sh
bash postcourses.sh
```
That will take an hour or so.  If you have the .vtt files locally, change the path in vtt2json.sh to the local path. This is 20x faster.

## Search
Then you can search and display results in the console
```
bash search.sh "first aid"
```

## Script Descriptions
Here's what each of the scripts does


### `setup.sh`
Stops the previous solr instance if running and removes it.  Then it posts schema using `addshema-lessons.sh`


### `addschema-lessons.sh` 
posts the schema, eg:
```
curl -X POST -H 'Content-type:application/json' --data-binary '{
  "add-field":[
    { "name": "vttPureText",       "type": "text_en", "stored": true },
    { "name": "courseId",          "type": "text_en", "stored": true },
    { "name": "lessonId",          "type": "text_en", "stored": true },
    { "name": "languageCode",      "type": "text_en", "stored": true },
    { "name": "lessonTitle",       "type": "text_en", "stored": true },
    { "name": "posterImage",       "type": "text_en", "stored": true },
    { "name": "allSearchText",     "type": "text_en", "stored": true, "multiValued": true }
  ],
  "add-copy-field":[
    { "source": "vttPureText",     "dest": ["allSearchText"] },
    { "source": "courseId",        "dest": ["allSearchText"] },
    { "source": "lessonId",        "dest": ["allSearchText"] },
    { "source": "lessonTitle",     "dest": ["allSearchText"] }
  ]
}' http://localhost:8983/solr/knowledgecity/schema
```

### `postcourses.sh` 
Retrieves `courselist_extended_en.json` from cdn and gets the list of courses and how many lessons they have, and calls `postcourse.sh` for each course.


### `postcourse.sh`
Usage
```
bash postcourse.sh [courseid] [totallessons]
```
Here's an example of how it's used (eg by `postcourses.sh`)
```
bash postcourse.sh BUS1000 45
```
Note, for now it only posts `en` (English) version of subtitles
It does o loop from 000 to 045 for example, and calls `postlesson.sh` for each lesson


### `postlesson.sh`
Usage:
```
bash postlesson.sh [lang] [courseid] [lesson]
```
Example:
```
bash postlesson.sh en BUS1000 001
```
Calls `cdnvtt2json.sh` specifying the language courseid and lesson, and posts the resulting `json` to the solr instance


### `cdnvtt2json.sh`
Usage:
```
bash cdnvtt2json.sh [lang] [courseid] [lesson]
```
Example:
```
bash cdnvtt2json.sh en BUS1000 003
```
Retrieves the lesson vtt file from the cdn, and extracts just the text, using `vtt2text.sh`, and adds the course id, lesson fields etc, and returns a json string ready to be posted to solr


### `vtt2text.sh`
Usage:
```
bash vtt2text.sh [.vtt file contents]
```
Example:
```
cat file.vtt | bash vtt2text.sh
```

### `search.sh`
Takes the search string parameter and posts to solr and outputs the result
Usage:
```
bash search.sh "[text]"
```
Example:
```
bash search.sh "first aid"
```

### NOTE:
the files have hardcoded localhost, that should be changed if running somewhere else.
