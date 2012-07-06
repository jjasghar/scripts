#!/bin/bash
for i in `cat prod_machines.txt` ; do scp linux_audit.sh $i://tmp/ ; done
for i in `cat prod_machines.txt` ; do ssh $i /tmp/linux_audit.sh  ; done
./pull_linux_audit.sh 
ls -ltra *.txt
