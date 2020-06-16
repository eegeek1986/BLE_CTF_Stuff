#! /usr/bin/bash

if [ "$#" -ne 1 ];
then
    echo "Usage: ./get_score.sh <mac>"
    exit
fi

gatttool -b $1 --char-read -a 0x002a |awk -F':' '{print $2}'|tr -d ' '|xxd -r -p;printf '\n'
