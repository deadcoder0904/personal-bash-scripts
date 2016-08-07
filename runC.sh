#!/bin/bash
echo "Running C Program $1"
echo "========================"

gcc -Wall $1 -lm # Compile C Program
./a.out # Display the output of C Program

echo
echo "========================"
echo "Program Successfully Ran"