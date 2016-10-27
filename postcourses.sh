#!/bin/bash
curl  "https://cdn0.knowledgecity.com/opencontent/portals/0bab2b80-f614-4a40-9356-2fd61b84d9d4/courselist_extended_en.json" 2>/dev/null |\
sed 's/,/,\n/g'                  |\
grep -E 'course_ID|totalLessons' |\
tr -d '":{,'                     |\
sed 's/course_ID/,\n/g'          |\
grep -v ','                      |\
sed 's/totalLessons//g'          |\
tr '\n' ' '                      |\
xargs -n 2 bash postcourse.sh