#!/bin/bash

for pid in $(ps -Ao pid)
do
        file="/proc/"$pid

        ppid=$(grep -Ehsi "ppid:\s+(.+)" $file"/status" | grep -o "[0-9]\+")
        sr=$(grep -Ehsi "se\.sum_exec_runtime(.+):\s+(.+)" $file/sched | awk '{print $3}')
        ns=$(grep -Ehsi "nr_switches(.+):\s+(.+)" $file/sched | awk '{print $3}')

        if [ -z "ppid" ];
        then
                ppid=0
        fi
        if [ -z $sr ] || [ -z ns ];
        then
                art=0
        else
                art=$(echo "scale=2; $sr/$ns" | bc | awk '{printf "%.2f", $0}')
        fi
        echo "$pid $ppid $art"
done | sort -nk2 | awk '{print "ProcessID="$1" : Parent_ProcessID="$2" : Average_Running_Time="$3}' > 4.out