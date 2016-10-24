curl 'http://localhost:8983/solr/knowledgecity/update/json/docs?commitWithin=5000&split=/exams&f=first:/first&f=last:/last&f=grade:/grade&f=subject:/exams/subject&f=test:/exams/test&f=marks:/exams/marks' -H 'Content-type:application/json' -d '
{
  "first": "John2",
  "last": "Doe2",
  "grade": 8,
  "exams": [
    {
      "subject": "Maths is a long sentence that has more words",
      "test"   : "term1",
      "marks"  : 90},
    {
      "subject": "Biology has many more words than you can see",
      "test"   : "term1",
      "marks"  : 86}
  ]
}'
