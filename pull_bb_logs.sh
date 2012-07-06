#!/bin/bash

USER=asgharje
DATE=2012-07-01
#DATE=`date +%F`
#TOMCAT_DATE=`date +%Y%m%d`
TOMCAT_DATE=20120701
#BB_DATE=`date +%Y-%m-%d`
BB_DATE=2012-07-01

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
    scp -C $USER@$i:/usr/local/blackboard/config/bb-config.properties $DATE.$i.bb-config.properties
    scp -C $USER@$i:/usr/local/blackboard/logs/bb-sqlerror-log.$BB_DATE.txt $DATE.$i.bb-sqlerror-log.$BB_DATE.txt
    scp -C $USER@$i:/usr/local/blackboard/logs/bb-sqlerror-log.txt $DATE.$i.bb-sqlerror-log.txt
    scp -C $USER@$i:/usr/local/blackboard/logs/tomcat/stdout-stderr-$TOMCAT_DATE.log $DATE.$i.stdout-stderr.txt
    scp -C $USER@$i:/usr/local/blackboard/logs/httpd/error_log $DATE.$i.error_log
    scp -C $USER@$i:/usr/local/blackboard/logs/httpd/mod_jk.log $DATE.$i.mod_jk.log
    scp -C $USER@$i:/usr/local/blackboard/config/bb-tasks.xml $DATE.$i.bb-tasks.xml
    scp -C $USER@$i:/usr/local/blackboard/config/bb-tasks.unix.xml $DATE.$i.bb-tasks.unix.xml
    scp -C $USER@$i:/usr/local/blackboard/logs/tomcat/catalina-log.txt $DATE.$i.catalina-log.txt
    echo ""
    echo "Done with $i"
    echo ""
done

#
# gzip the files
#
gzip *
cd ..

#
# tar up the directory into a tarball
#
tar zcf bb_log_pull.$DATE.tar.gz $DATE/

#
# Delete the $DATE/ directory
#
rm -rf $DATE/

# Complete
echo "Your file name is bb_log_pull.$DATE.tar.gz"

