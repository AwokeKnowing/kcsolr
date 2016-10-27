#!/bin/bash
#
curl "http://localhost:8983/solr/knowledgecity/select"                        \
--data df=allSearchText                                                       \
--data facet.field=courseId                                                   \
--data facet=on                                                               \
--data fl=id,courseId,lessonId,languageCode,lessonTitle,posterImage           \
--data hl=on                                                                  \
--data indent=on                                                              \
--data spellcheck=on                                                          \
--data wt=json                                                                \
--data rows=20                                                                \
--data-urlencode q="${1}"