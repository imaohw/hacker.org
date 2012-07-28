#!/bin/bash

cp doll.bin /tmp/doll

while true; do
    zcat /tmp/doll > /tmp/doll2 2>/dev/null
    [ $? -ne 0 ] && cat /tmp/doll && exit
    mv /tmp/doll2 /tmp/doll
done
