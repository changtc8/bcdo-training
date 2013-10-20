#!/bin/bash
# split the argu list into 2 pieces; take the last word from 2nd piece and put it to the front
# if arug is not evenly divided make 2nd the longer list
# print the shuffle list
#
# test:
#   shuffle a b c d e f g h i
# result:
#   i
#   a   # first piece
#   e
#   b   # first piece
#   f
#   c   # first piece
#   g
#   d   # first piece
#   h

arry=( "$@" )
tot=$#
#echo " tot = ${tot} "
len=`expr ${tot} / 2`

tot=`expr ${tot} - 1`
#echo " len = ${len} tot = ${tot} "
echo ${arry[${tot}]}
i=0
j=${len}
while [ ${i} -lt ${len} ]
do 
     echo ${arry[${i}]}
#     echo " i = ${i}, j =  ${j} "
#  to take care the even number of words 
     if [ ${j} -lt ${tot} ]; then
        echo ${arry[${j}]}
     fi
     i=`expr ${i} + 1`
     j=`expr ${j} + 1`
done

