#!/bin/bash

curr=0
sum=0
avg=0
count=1

echo -e "$(<4.out)\n" | sed "s/[^0-9.]\+/ /g" | sed "s/^ //g" | while read line;
do
        pid=$(awk '{print $1}' <<< $line)
        ppid=$(awk '{print $2}' <<< $line)
        art=$(awk '{print $3}' <<< $line)
        if [[ $ppid == $curr ]];
        then
                sum=$(echo "$sum+$art" | bc | awk '{printf "%.2f", $0}')
                count=$(($count+1))
        else
                avg=$(echo "scale = 2; $sum/$count" | bc | awk '{printf "%.2f", $0}')
                echo "Average_Running_Children_of_ParentID="$curr" is "$avg
                sum=$art
                count=1
                curr=$ppid
        fi
        if [[ -n $pid ]];
        then
                    echo "ProcessID="$pid" : Parent_ProcessID="$ppid" : Average_Running_Time="$art
        fi
done > 5.out
