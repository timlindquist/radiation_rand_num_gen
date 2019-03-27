#!/bin/bash
echo `rm geigerCap.txt`

while [ 1 ]
do
    echo  `hexdump -e '16/1 "%02x " "\n"' geigerCap.txt > geigerRaw.txt`
    echo "Converting .txt to hex"
    sleep 0.1
done
