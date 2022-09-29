#!/bin/bash

#cat /var/log/*.log | wc -l

for filename in /var/log/*.log;
do
        let result+=`cat "$filename" | wc -l`
done
echo $result