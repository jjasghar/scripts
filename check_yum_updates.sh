#!/bin/bash

DATE=`date +%F`
HOSTNAME=`hostname -s`
EMAIL=jjasghar@utexas.edu

yum check-update > /tmp/$DATE.check_update.txt
mail -s "Weekly $HOSTNAME check-update" $EMAIL < /tmp/$DATE.check_update.txt
rm /tmp/$DATE.check_update.txt

