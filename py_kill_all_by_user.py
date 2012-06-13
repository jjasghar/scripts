#!/usr/bin/env python

#
# This is an attempt to kill all procs by an owner
#

import os
import sys
import subprocess

def main():
        if (len(sys.argv) > 1):
                ps_grep(sys.argv[1:])
        else:
                print "no args"

def ps_grep(u):
        ps="ps"
        psopt="-ej"
        grep="grep"
        cmd="ps aux |grep "
        for i in u:

            ## James suggested this is "cleaner"
            #p1=subprocess.Popen([ps,psopt],stdout=subprocess.PIPE) 
            #p2=subprocess.Popen([grep, i],stdin=p1.stdout,stdout=subprocess.PIPE)
            #p1.stdout.close()
            #print p2.communicate()[0]
            ##

            ## This just "works"
            subprocess.call(cmd + i, shell=True)


if __name__ == "__main__":
        main()
