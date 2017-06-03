#!/bin/bash
echo "Running Emulator"
echo "========================"

cd ~/Android/Sdk/tools
./emulator -avd Nexus_5X_API_24 -gpu off

echo
echo "========================"
echo "Emulator Successfully Ran"