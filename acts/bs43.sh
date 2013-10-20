#!/bin/bash
# reads lines from stdin. For each line, print the number of words on the line.
# Example:
#   $ (echo a b c d e f g; echo x y z; echo '') | bs43
# Result:
#   7
#   3
#   0
#
#
while read line;
do
   a=0
   arry=( $line )
   while [ ${arry[$a]} ]
   do
      a=`expr $a + 1`
   done
   echo " ${a} "
done

