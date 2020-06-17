#! /usr/bin/bash

if [ "$#" -ne 2 ];
then
    echo "Usage: ./fast_read.sh <mac> <handle>"
    exit
fi

i=0
echo "Starting reads"
start_time=$(date -u +%s)

while true;
do
    resp=$(gatttool -b $1 --char-read -a $2|awk -F':' '{print $2}'|tr -d ' '|xxd -r -p)
    if [ "$resp" != "Read me 1000 times" ];
    then
       end_time=$(date -u +%s)
       total_time="$(($end_time-$start_time))"
       echo -n "$i reads done in $total_time seconds, here is your flag: "
       echo $resp
       exit
    fi
    i="$(($i + 1))"
done
