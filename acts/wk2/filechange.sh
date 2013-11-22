#!/bin/bash
# before start scrpt save st-time YYYY-MM-DD 
# 2013-10-08 04:36:51
sttime=`date +%Y-%m-%d\ %H:%M:%S`
# get the file modify time
modifytime=`stat "$1" | grep Modify | cut -c 9-27`
# Compute the seconds since epoch for date 1
t1=`date --date="$sttime" +%s`
t2=`date --date="$modifytime" +%s`
tdiff=`expr $t2 - $t1`
if [ $tdiff -gt 0 ]; then
   echo 1
else
   echo 0
fi

