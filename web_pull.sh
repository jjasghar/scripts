#!/bin/bash

# this will pull a file via wget 

TMPDIR=$(/bin/mktemp -d)
TMPFILE=$(/bin/mktemp)

# read line to pull file

echo "Location of the file"
read web_location_of_file

# pull file here
pull_file {
    TMPDIR=$(/bin/mktemp -d)
    cd TMPDIR
    wget $web_location_of_file
}

pull_file()

# output file here
