#!/bin/bash
# get bash version and print good if ver > 3
VER=`bash --version | grep version | cut -c 19`
#echo $VER
if [  3 -lt ${VER} ]; then 
   echo "Bad Version" 
   exit 1
else
   echo "Good Version"
   exit 0
fi
