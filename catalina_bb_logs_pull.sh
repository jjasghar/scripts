#!/bin/bash

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
tar zcf catalina_log_pull.$DATE.tar.gz $DATE/

#
# Delete the $DATE/ directory
#
rm -rf $DATE/

# Complete
echo "Your file name is catalina_log_pull.$DATE.tar.gz"

