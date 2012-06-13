#!/bin/bash
echo "enter the sting: "
read str;

countStringLength() {
        echo `echo -n $1 | wc -c`

        # Or can use the below trick to get the string length
        # I prefer to use the first one - easy to use and easy to remember
        echo ${#1}
}
countStringLength $str

