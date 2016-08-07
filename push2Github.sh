#!/bin/bash
echo "Pushing to Github"
echo "========================"

message="Adding script on `date`"
echo $message
git add . # Git add all
git commit -m "$message" # Git Set Message  
git push -u origin master # Git push to origin master

echo
echo "========================"
echo "Github Push Successful"