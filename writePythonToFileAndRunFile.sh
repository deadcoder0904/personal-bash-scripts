#!/bin/bash
echo "Writing Python to $2"
echo "========================"

python $1 > $2 # Writing the python's print scripts to a file
python $2

echo
echo "========================"
echo "Script Successfully Written to $2"