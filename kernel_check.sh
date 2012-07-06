#!/bin/bash

for i in `cat machines.txt` 
do
	ssh $i "uname -a"
done
