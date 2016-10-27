#!/bin/bash
language=$1
courseid=$2
lesson=$3

vttpuretext=$(curl 'https://cdn0.knowledgecity.com/opencontent/courses/captions/vtt/'$language'/'$courseid'-'$lesson'.vtt' 2>/dev/null | bash vtt2text.sh)
#vttpuretext=$(curl 'file://'$(pwd)'/test.vtt' 2>/dev/null | bash vtt2text.sh)

echo '{"courseId": "'$courseid'",'
echo ' "lessonId": "'$courseid'-'$lesson'",'
echo ' "languageCode": "'$language'",'
echo ' "lessonTitle": "LESSONTITLE",'
echo ' "posterImage": "POSTERIMAGE",'
echo ' "vttPureText": "'$vttpuretext'"}'
echo
