#!/bin/bash
echo "Running Jekyll & Pushing to Github"
echo "========================"

message=${1:-"Adding script on `date`"}  
echo $message
cd "/media/deadcoder0904/TIMEPASS/Coding/Awesome Templates/Personal Site/best-a2k/blog"
bundle exec jekyll build
cp README.md ../blog-pages
cd "../blog-pages"
`${BASH_ALIASES[push2Github]}`

echo
echo "========================"
echo "Jekyll Content Served & Github Push Successful"