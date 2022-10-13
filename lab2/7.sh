#!/bin/bash

while [[ "SECONDS" -le "10" ]]; do
    for pid in $(ps aux | awk '{print $2}'); do
    if [[ "pid" -ne "$$" ]]; then
        if [[ -z ${startingBytes[$pid]} ]]; then
        if [[ -r /proc/$pid/io ]]; then
startingBytes[$pid]=$(grep "rchar" /proc/$pid/io | awk '{print $2}')
diff[$pid]="0"
process[$pid]=$(cat /proc/$pid/cmdline | tr -d '\0')
PIDs[$pid]=$pid
        fi
        else
        let diff[$pid]=$(grep "rchar" /proc/$pid/io | awk '{print $2}')-${startingBytes[$pid]}
        fi
    fi
    done
    echo -ne "$SECONDS\r"
done
echo "$(
for pid in "${PIDs[@]}"
do
        echo ""$pid":"${process[$pid]}":"${diff[$pid]}""
done
)" | sort -nk4 -r -t: | tail -n 3