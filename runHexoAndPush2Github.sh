#!/bin/bash
echo "Running Hexo & Pushing to Github"
echo "========================"

cd "/media/deadcoder0904/DEAD/Coding/General/blog"
push2Github # Push Hexo Code to another Github repo

hexo generate # Generate static files

cd public	# Static HTML directory

push2Github # Push Hexo Sites Code to another Github repo

# Deploy the Page on Github-Pages

git checkout gh-pages
git merge master
git push origin gh-pages
git checkout master

echo
echo "========================"
echo "Hexo Content Served & Github Push Successful"