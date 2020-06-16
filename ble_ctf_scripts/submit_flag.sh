#! /usr/bin/bash

if [ "$#" -ne 2 ];
then
    echo "Usage: ./submit_flag.sh <mac> <flag>"
    exit
fi

gatttool -b $1 --char-write-req -a 0x002c -n $(echo -n $2 |xxd -ps)
