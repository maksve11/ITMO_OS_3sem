#!/bin/bash

echo "choose command:"
echo "1) open nano"
echo "2) open vi"
echo "3) open links"
echo "4) exit"

read cmd
if [[ $cmd -eq 1 ]]; then
        nano
elif [[ $cmd -eq 2 ]]; then
        vi
elif [[ $cmd -eq 3 ]]; then
        links
else
        exit
fi