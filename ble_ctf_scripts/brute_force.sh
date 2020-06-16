#! /usr/bin/bash

if [ "$#" -ne 2 ];
then
    echo "Usage: ./brute_force.sh <mac> <handle>"
    exit
fi

for i in {0..255}
do
    echo -n "Trying $i: "
    x=$(printf "%x" $i)
    gatttool -b $1 --char-write-req -a $2 -n $(echo -ne "\x$x" | xxd -ps)
    resp=$(gatttool -b $1 --char-read -a $2|awk -F':' '{print $2}'|tr -d ' '|xxd -r -p)

    if [ "$resp" != "Brute force my value 00 to ff" ];
    then
       echo -n "$i worked, here is your flag: "
       echo $resp
       exit
    fi   
done
