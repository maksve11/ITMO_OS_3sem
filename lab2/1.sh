#!/bin/bash

procinfo=$(ps -U "$USER")
echo "$procinfo" | tail -n+2 | wc -l > output1
echo "$procinfo" | awk '{print $1":"$4}' >> output1