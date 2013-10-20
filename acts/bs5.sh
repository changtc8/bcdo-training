#!/bin/bash
# script to read full path file list and print only the fie name
#  awk -F '/' '{print $NF}' 
#  -F is descriptor $NF last one
#
#  ${var  - from var
#    ##   - trim from beginning
#    *    - everything
#    /    - unitl the last /
#
# test:
#   bs5 /home/somebody/bin/tester /tmp / /usr/share/man/man1/man.1
#
# result:
#   tester
#   tmp
#
#   man.1
#
for var in "$@"
do
#    echo " $var "
    fname=${var##*/}
    echo "${fname}"
done
