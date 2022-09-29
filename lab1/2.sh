#!/bin/bash
result=""
while :; do
        read line
        if [[ "$line" == "q" ]]
        then break
        fi
        result+="$line"
done
echo "$result"