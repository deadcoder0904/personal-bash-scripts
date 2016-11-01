#!/bin/bash
echo "Checkout gh-pages And merge with master"
echo "*********************************************************"

gc gh-pages
git merge master
gpog
gc master

echo
echo "*********************************************************"
echo "Checkout gh-pages And merge with master Successful"
