#!/bin/bash

sh 4loop.sh & pid0=$!
sh 4loop.sh & pid1=$!
sh 4loop.sh & pid2=$!

renice +10 -p $pid0

at now + 1 minute <<< "kill ${pid0} ; kill ${pid1} ; kill ${pid2}"