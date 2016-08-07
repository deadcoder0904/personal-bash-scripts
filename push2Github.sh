#!/bin/bash
echo "Pushing to Github $1"
echo "========================"

message=$1 || "Adding script on `date`"
git add .
git commit -am message 
git push -u origin master

echo
echo "========================"
echo "Github Push Successful"