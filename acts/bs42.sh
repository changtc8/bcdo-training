#!/bin/bash
# take 2 argument M and N; read stdin for each line of input; 
# split line into words; print word M thru N inclusive
# M and N are 0 base
#
# test:
# (echo a1 b1 c1 d1 e1 f1; echo g2 h2 i2 j2 k2) | bs42 2 4 
#
# result:
#   c1 d1 e1
#   i2 j2 k2
#
while read line;
do
   arry=( $line )
   a=$1
   while [ $a -le $2 ]
   do
      echo -n "${arry[$a]} "
      a=`expr $a + 1`
   done
   echo " "
done
