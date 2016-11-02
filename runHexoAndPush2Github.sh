#!/bin/bash
echo "Running Hexo & Pushing to Github"
echo "========================"

rm -rf "/media/deadcoder0904/DEAD/Coding/General/blog/public/"
cd "/media/deadcoder0904/DEAD/Coding/General/blog/"
hexo generate

push2Github

cd "/media/deadcoder0904/DEAD/Coding/General/blog-site/"
mv "/media/deadcoder0904/DEAD/Coding/General/blog-site/.git" "/media/deadcoder0904/DEAD/Coding/General/.git"
mv "/media/deadcoder0904/DEAD/Coding/General/blog-site/CNAME" "/media/deadcoder0904/DEAD/Coding/General/CNAME"
mv "/media/deadcoder0904/DEAD/Coding/General/blog-site/README.md" "/media/deadcoder0904/DEAD/Coding/General/README.md"
cd "/media/deadcoder0904/DEAD/Coding/General/"
rm -rf "/media/deadcoder0904/DEAD/Coding/General/blog-site/"
mkdir "/media/deadcoder0904/DEAD/Coding/General/blog-site/"
cp -R "/media/deadcoder0904/DEAD/Coding/General/blog/public/." "/media/deadcoder0904/DEAD/Coding/General/blog-site/"
cd "/media/deadcoder0904/DEAD/Coding/General/blog-site/"
mv "/media/deadcoder0904/DEAD/Coding/General/.git" "/media/deadcoder0904/DEAD/Coding/General/blog-site/.git"
mv "/media/deadcoder0904/DEAD/Coding/General/CNAME" "/media/deadcoder0904/DEAD/Coding/General/blog-site/CNAME"
mv "/media/deadcoder0904/DEAD/Coding/General/README.md" "/media/deadcoder0904/DEAD/Coding/General/blog-site/README.md"
push2Github

# Create gh-pages branch for the first time using command `git checkout -b gh-pages`
checkoutGhpagesAndMergeWithMaster

echo
echo "========================"
echo "Hexo Content Served & Github Push Successful"