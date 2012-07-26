#!/bin/bash

FULLFILE=/usr/local/blackboard/apps/oracle-client/network/admin/tnsnames.ora
FILE=tnsnames.ora

USER=asgharje
DATE=`date +%F`
TOMCAT_DATE=`date +%Y%m%d`
BB_DATE=`date +%Y-%m-%d`

#
# Create the directory
#
mkdir $DATE
cd $DATE

#
# Pull the files down
#
for i in "spider.its.utexas.edu" "maeve.its.utexas.edu" "nancy.its.utexas.edu" "tristran.its.utexas.edu" "rosie.its.utexas.edu"
do
    echo ""
    echo "Now pulling from $i"
    echo ""
    scp -C $USER@$i:$FULLFILE $DATE.$i.$FILE
    echo ""
    echo "Done with $i"
    echo ""
done

