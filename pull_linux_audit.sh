#!/bin/bash

for i in `cat prod_machines.txt` 
do
    scp $i://tmp/*.txt ./
    ssh $i rm /tmp/*.txt
done
