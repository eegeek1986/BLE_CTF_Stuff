#! /usr/bin/bash

if [ "$#" -ne 2 ];
then
    echo "Usage: ./listen_indication.sh <mac> <handle>"
    exit
fi

gatttool -b $1 --char-write-req -a $2 --value=0200 --listen
