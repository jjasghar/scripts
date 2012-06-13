#!/bin/bash

# this was created 4/13/12 to convert files from spider.its.utexas.edu:///mnt/archives/course_exports/2009_spring/remove/ to the output
# <course_id>|<batch_uid>|<course_name>|2009_<semester>_classes
# i pulled the export.csv from courses_main table and ran this awk, i had to create a sed to get rid of all of the " "s

# course_id = $10
# batch_uid = $14
# course_name = $9

# select course_id || '|' || batch_uid || '|' || course_name || '|2009_spring_classes'  from course_main where course_id like '%2009_spring%'

# cat 2009_spring_classes.out | sed 's/"//g' >> 2009_spring_classes_sed.out


for i in `cat 2009_summer_exports.bbexport` 
do
    COURSE_ID=`echo $i | awk -F , '{print $1}'`
    grep $COURSE_ID export.csv | awk -F , '{print $10 "|" $14 "|" $9 "| 2009_summer_classes" }' >> 2009_summer_classes.out
done

# added after the script had been completed
cat 2009_summer_classes.out | sed 's/"//g' >> 2009_summer_classes_sed.out