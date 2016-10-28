#!/bin/bash
echo "Run uglify and push to Github gh-pages"
echo "*********************************************************"

npm run uglify
push2Github
createGhpagesAndMergeWithMaster

echo
echo "*********************************************************"
echo "Run uglify and push to Github gh-pages Push Successful"
