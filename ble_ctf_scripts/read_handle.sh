#! /usr/bin/bash

if [ "$#" -ne 2 ];
then
    echo "Usage: ./read_handle.sh <mac> <handle>"
    exit
fi

gatttool -b $1 --char-read -a $2|awk -F':' '{print $2}'|tr -d ' '|xxd -r -p;printf '\n'
