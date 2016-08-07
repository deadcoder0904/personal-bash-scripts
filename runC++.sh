#!/bin/bash
echo "Running C++ Program $1"
echo "========================"

g++ $1 # Compile C Program
./a.out # Display the output

echo
echo "========================"
echo "Program Successfully Ran"