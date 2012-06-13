#!/usr/bin/env python

import subprocess

def uname_func():

    uname='uname'
    uname_arg = '-a'
    print "Gathering data with %s command:\n" % uname
    subprocess.call([uname, uname_arg])

def disk_func():

    diskspace = 'df'
    diskspace_arg = '-h'
    print "Gathering data with %s command:\n" % diskspace
    subprocess.call([diskspace, diskspace_arg])

def main():
    uname_func()
    disk_func()


if __name__ == "__main__":
    main()
