#!/bin/bash

at now + 2 minutes -f ~/lab3/1.sh

tail -n 0 -f ~/report &
pid=$!(sleep 120 ; kill "$pid") &