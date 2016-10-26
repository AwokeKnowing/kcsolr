#!/bin/bash
language=$1
courseid=$2
lesson=$3

vttpuretext=$(curl 'https://cdn0.knowledgecity.com/opencontent/courses/captions/vtt/'$language'/'$courseid'-'$lesson'.vtt' 2>/dev/null | bash vtt2text.sh | sed 's/\\/\\\\/g')
#vttpuretext=$(curl 'file:///home/james/gits/kcsolr/test.vtt' 2>/dev/null | bash vtt2text.sh | sed 's/\\/\\\\/g')

cat lesson.json |\
sed "s/COURSEID/$courseid/" |\
sed "s/LESSONID/$courseid-$lesson/" |\
sed "s/LANGUAGECODE/$language/" |\
sed "s/VTTPURETEXT/$vttpuretext/" 
echo

