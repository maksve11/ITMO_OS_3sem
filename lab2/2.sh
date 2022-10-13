#!/bin/bash

ps -Ao pid,argc | awk '{if ($2 ~ "^/sbin/") print $1" : "$2}' > output2