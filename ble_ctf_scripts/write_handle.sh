#! /usr/bin/bash

if [ "$#" -ne 3 ];
then
    echo "Usage: ./write_handle.sh <mac> <handle> <string_value>"
    exit
fi

gatttool -b $1 --char-write-req -a $2 -n $(echo -n $3|xxd -ps)
