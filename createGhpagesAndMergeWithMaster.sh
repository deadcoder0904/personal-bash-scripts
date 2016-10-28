#!/bin/bash
echo "Create gh-pages And merge with master"
echo "*********************************************************"

gc -b gh-pages
git merge master
gpog
gc master

echo
echo "*********************************************************"
echo "Create gh-pages And merge with master Successful"
