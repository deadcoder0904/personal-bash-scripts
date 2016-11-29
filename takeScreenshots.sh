#!/bin/bash
echo "Take Screenshots for $1"
echo "####################################################"

pageres $1 $(awk '{a = $1 " " a} END {print a}' '/media/deadcoder0904/DEAD/Coding/General/personal-bash-scripts/all-resolutions.txt')

echo
echo "####################################################"
echo "Took Screenshots Successfully"