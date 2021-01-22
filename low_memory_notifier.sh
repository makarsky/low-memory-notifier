#!/bin/bash

#Minimum available memory limit, MB
THRESHOLD=900

#Check time interval, sec
INTERVAL=3

while :
do

    free=$(free -m|awk '/^Mem:/{print $4}')
    buffers=$(free -m|awk '/^Mem:/{print $6}')
    cached=$(free -m|awk '/^Mem:/{print $7}')
    available=$(free -m | grep Mem | awk '{print $7}')

    message="Free $free""MB"", buffers $buffers""MB"", cached $cached""MB"", available $available""MB"""

    if [ $available -lt $THRESHOLD ]
        then
        notify-send "Memory is running out!" "$message"
    fi

    echo $message

    sleep $INTERVAL

done

