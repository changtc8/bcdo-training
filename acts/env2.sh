#!/bin/bash
#  "strace -o strace.out bash --login < /dev/null"
# read strace.out and create a listing of all the system calls made by bash.
# Count the calls and print out the top 20, in descending order
# 
#
# sort strace.out > stout.sort
# this script read from stout.sort
#
declare -A arr
while read line;
do
   key=${line%(*}  # everything before (

   exist = find_key(arr, ${key})
for i in "${!array[@]}"
do
  echo "key  : $i"
  echo "value: ${array[$i]}"
done
   
   if found count++
   else add new array element key, count=0
done
