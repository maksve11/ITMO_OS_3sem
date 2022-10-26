#!/bin/bash

while true;
do
    read line
    echo "$line" > pipe
    if [[ "$line" == "QUIT" ]]
    then
        echo "Script successfully finished"
        exit 0
    fi
    if [ "$line" != "+" ] && [ "$line" != "*" ]
    then
        if ! [ "$line" -eq "$line" ] 2>/dev/null
        then
            echo "Error: unknown command"
            exit 1
        fi
    fi
done