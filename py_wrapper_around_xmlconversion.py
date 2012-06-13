#!/usr/bin/env python

# Presteps
# export CMI=/usr/local/footprints

# first i need to call the script
#  a) this checks asks for the original "MASTERXX" and confirms this, then asks for what its supposed to be, "MASTERYY"
#  b) /usr/footprints_perl/bin/perl mrXMLConversion.pl --project=YY
#    var = "/some/file/path/"
#    pipe = subprocess.Popen(["perl", "uireplace.pl", var])

# second i need to run the script
#  a) this includes the options that are asked by the script, "y, n, y, y, y"

# third takes the data for the failure

# forth check it against an array of known "good" names

# fifth if not part of that known good list, grep out the name from the xml file
#   a) confirm that the name matches the name and write it to a file

# sixth delete every entry for that name
# #!/bin/bash
#  make a back up! changes in place!
#
#[ -s "$1" ] || (echo "no file $1" && exit)
#if [ ! $# -eq 2 ]; then
#  echo "wrong args $# : $@" 
#  exit
#fi
#sed -ri "s#<$2>(.+)</$2>##g" "$1"

# rerun the script
#   a) if successful output the data to a log file and complete the script
