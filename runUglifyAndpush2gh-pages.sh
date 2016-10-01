#!/bin/bash
echo "Run uglify and push to Github gh-pages"
echo "*********************************************************"

npm run uglify
push2Github
gc gh-pages
git merge master
gpog
gc master

echo
echo "*********************************************************"
echo "Run uglify and push to Github gh-pages Push Successful"