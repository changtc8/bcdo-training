#!/bin/bash
# removes the filename extension (the part of the filename after the last dot) from
# each arg. If there is no extension, print the arg without change
#
# test:
#   bs52 /home/somebody/build/abc.c main.h /tmp/b123 abc.def/ghi
#
# result:
#   /home/somebody/build/abc
#   main
#   b123
#   abc.def/ghi
#   
# FILE="example.tar.gz"
# echo "${FILE%%.*}"
#example
# echo "${FILE%.*}"
#example.tar
# echo "${FILE#*.}"
#tar.gz
# echo "${FILE##*.}"
#gz

for var in "$@"
do
#    fname=${var##*/}
    echo "${var%.*}"
done
