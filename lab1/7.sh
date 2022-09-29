#!/bin/bash

grep -E -s -o -r -h "[[:alnum:]._-]+@[[:alnum:].-]+\\.[[:alpha:]]{2,6}" /etc/ | tr -s "\n" "," | awk '{print $1}' | paste -s -d, - > emails.lst
