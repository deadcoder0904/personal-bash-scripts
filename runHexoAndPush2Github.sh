#!/bin/bash
echo "Running Hexo & Pushing to Github"
echo "========================"

push2Github # Push Hexo Code to another Github repo

cd "/media/deadcoder0904/DEAD/Coding/General/blog"
hexo generate # Generate static files

cd public	# Static HTML directory

push2Github # Push Hexo Sites Code to another Github repo
checkoutMasterAndMergeWithGhpages # Deploy the Page on Github-Pages

echo
echo "========================"
echo "Hexo Content Served & Github Push Successful"