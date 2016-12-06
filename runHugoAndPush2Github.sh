#!/bin/bash
echo "Running Hugo & Pushing to Github"
echo "========================"

cd "/media/deadcoder0904/DEAD/Coding/General/deadcoder0904.github.io-code/"
hugo

push2Github # push uncompiled code to Github

rsync --recursive  "/media/deadcoder0904/DEAD/Coding/General/deadcoder0904.github.io-code/public/" "/media/deadcoder0904/DEAD/Coding/General/deadcoder0904.github.io/"

cd "/media/deadcoder0904/DEAD/Coding/General/deadcoder0904.github.io/"

push2Github # push static site to Github

echo
echo "========================"
echo "Hugo Content Served & Github Push Successful"