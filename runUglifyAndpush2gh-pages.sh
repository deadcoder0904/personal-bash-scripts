#!/bin/bash
echo "Pushing to Github gh-pages"
echo "========================"

npm run uglify
push2Github
gc gh-pages
git merge master
gpog
gc master

echo
echo "========================"
echo "Github gh-pages Push Successful"