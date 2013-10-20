#!/bin/bash
# run test a few; do you get same result
#
# test:
#   (echo foo.log; echo genius/spew.log) | bs7
#
while read fname
do
  echo mv $fname ${fname/.log/.LOG/}
done
