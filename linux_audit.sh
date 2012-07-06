#!/bin/bash

DATE=`date +%F`
HOSTNAME=`hostname -s`

uname -a > out1.txt
echo "" > out2.txt
uptime > out3.txt
echo "" > out4.txt
rpm -qa | sort -u > out5.txt
echo "" > out6.txt
df -h > out7.txt
cat out* | tee $HOSTNAME.$DATE.txt
rm out*.txt
cp $HOSTNAME.$DATE.txt /tmp/
