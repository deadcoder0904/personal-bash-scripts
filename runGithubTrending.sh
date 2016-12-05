#!/bin/bash
echo "Run Github Trending"
echo "####################################################"

cd "/media/deadcoder0904/DEAD/Coding/100dayz/github-trending-json-api"
yarn start
message=${1:-":sparkles: `date` :cupid: :skull:"}  
echo $message

git add . # Git add all
git commit -m "$message" # Git Set Message  
git push -u origin master # Git push to origin master

echo
echo "####################################################"
echo "Run Github Trending Successful"
