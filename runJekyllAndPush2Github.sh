#!/bin/bash
echo "Running Jekyll & Pushing to Github"
echo "========================"

message=${1:-"Adding script on `date` :blush:"}  
echo $message
cd "/media/deadcoder0904/DEAD/Coding/General/blog"
bundle exec jekyll build
cp README.md ../blog-pages
cd "../blog-pages"
push2Github

echo
echo "========================"
echo "Jekyll Content Served & Github Push Successful"