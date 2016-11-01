#!/bin/bash
echo "Checkout master And merge with gh-pages"
echo "*********************************************************"

gc master
git merge gh-pages
gpom

echo
echo "*********************************************************"
echo "Checkout master And merge with gh-pages Successful"
