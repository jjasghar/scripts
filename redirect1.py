#!/usr/bin/env python

import sys
while 1:
    try:
        input = sys.stdin.readline()
        if input:
            sys.stdout.write('Echo to stdout: %s'%input)
            sys.stderr.write('Echo to stderr: %s'%input)
    except KeyboardError:
         sys.exit()
