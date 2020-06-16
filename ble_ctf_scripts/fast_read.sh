#! /usr/bin/bash

if [ "$#" -ne 2 ];
then
    echo "Usage: ./fast_read.sh <mac> <handle>"
    exit
fi


while true;
do
    resp=$(gatttool -b $1 --char-read -a $2|awk -F':' '{print $2}'|tr -d ' '|xxd -r -p)
    if [ "$resp" != "Read me 1000 times" ];
    then
       echo -n "Done, here is your flag: "
       echo $resp
       exit
    fi   
done
