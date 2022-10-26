#!/bin/bash

result=0
mode="+"
echo "Current mode: plus"
(tail -f pipe ; pid=$!) |
while true;
do
    read line
    case $line in
        "+")
            mode="+"
            echo "Current mode: plus"
        ;;
        "*")
            mode="*"
            echo "Current mode: multiply"
        ;;
        "QUIT")
            kill $pid 2>/dev/null
            echo "Successfully finished!"
            exit 0
        ;;
        *)
            if [ "$line" -eq "$line" ] 2>/dev/null
               then
                case $mode in
                    "+")
                        let result=$result\+$line
                        echo "$result"
                    ;;
                     "*")
                        let result=$result\*$line
                        echo "$result"
                    ;;
                esac
            else
                kill $pid 2>/dev/null
                echo "Error!"
                exit 1
            fi
        ;;
    esac
done