#!/bin/bash
# take infinite number of arugments; 1st argu N is a number; 
# print the Nth argument; N is 1 base; if N is > #argu print empty 
# assume N is positive
#
# test:
#    bs4 2 w1 w2 w3 w4
# result: 
#    w2
#
if [ $1 -gt $# ]; then
   echo ""
   exit 0
else
   echo " N = $1 "
fi
arry=( "$@" )
echo ${arry[$1]}
