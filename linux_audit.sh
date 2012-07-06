#!/bin/bash

DATE=`date +%F`
HOSTNAME=`hostname -s`

uname -a >> $HOSTNAME.$DATE.txt
echo "" >> $HOSTNAME.$DATE.txt
uptime >> $HOSTNAME.$DATE.txt
echo "" >> $HOSTNAME.$DATE.txt
rpm -qa | sort -u >> $HOSTNAME.$DATE.txt
echo "" >> $HOSTNAME.$DATE.txt
df -h >> $HOSTNAME.$DATE.txt
cp $HOSTNAME.$DATE.txt /tmp/
