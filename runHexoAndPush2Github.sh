#!/bin/bash
echo "Running Hexo & Pushing to Github"
echo "========================"

cd "/media/deadcoder0904/DEAD/Coding/General/100dayz-code/"
sudo hexo generate

push2Github # push uncompiled code to Github

# cd "/media/deadcoder0904/DEAD/Coding/General/100dayz-code/docs/"
# rm -rf "/media/deadcoder0904/DEAD/Coding/General/100dayz-code/docs/lib"

# mv "/media/deadcoder0904/DEAD/Coding/General/100dayz-code/docs/vendor" "/media/deadcoder0904/DEAD/Coding/General/100dayz-code/docs/lib"

# rm -rf "/media/deadcoder0904/DEAD/Coding/General/100dayz-code/docs/vendor"

# findAndReplace

rsync --recursive  "/media/deadcoder0904/DEAD/Coding/General/100dayz-code/docs/" "/media/deadcoder0904/DEAD/Coding/General/100dayz/"

cd "/media/deadcoder0904/DEAD/Coding/General/100dayz/"

push2Github # push static site to Github
checkoutGhpagesAndMergeWithMaster
gc master

echo
echo "========================"
echo "Hexo Content Served & Github Push Successful"