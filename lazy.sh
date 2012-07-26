#!/bin/bash
for i in `cat prod_machines.txt` ; do scp puppet.repo $i://tmp/ ; done

