#! /usr/bin/bash

if [ "$#" -ne 3 ];
then
    echo "Usage: ./write_handle_hex.sh <mac> <handle> <int_value>"
    exit
fi

x=$(printf "%x" $3)
gatttool -b $1 --char-write-req -a $2 -n $(echo -ne "\x$x" | xxd -ps)
