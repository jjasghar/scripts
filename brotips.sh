#!/bin/bash
while [ 1 ]
do
lynx --dump www.brotips.com/random | awk -F "brotip #" '{print $2}' | cut -d":" -f2 | awk -F '%0A%0Aht' '{print $1}' | sed -e's/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g' | xargs -0 echo -e  | awk '/./'
sleep 1m
done
