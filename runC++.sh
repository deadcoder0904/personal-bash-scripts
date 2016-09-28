#!/bin/bash
echo "Running C++ Program $1"
echo "========================"

g++ $1 # Compile C Program
./a.out # Display the output of C++ Program
rm -rf a.out # Remove the output of C++ Program

echo
echo "========================"
echo "Program Successfully Ran"