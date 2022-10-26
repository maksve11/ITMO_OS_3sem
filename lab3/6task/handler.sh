#!/bin/bash

echo $$ > .pid
result=1
mode="+"
usr1()
{
    mode="+"
}
usr2()
{
    mode="*"
}
term()
{
    mode="term"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true;
do
    case $mode in
        "+")
            let result=$result\+2
            echo "$result"
        ;;
        "*")
            let result=$result\*2
            echo "$result"
        ;;
        "term")
            echo "Handler has finished by SIGTERM!"
            exit 1
        ;;
    esac
    sleep 1
done