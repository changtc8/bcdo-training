#!/bin/bash
# write err subroutine which print parameters surrounded by square brackets
# print program name: then call err pasing all parameters
#
# test:
#    bs3 a '*test*' error message
# result:
#    bs3: [a *test* error message]
echo -n $0 
echo -n ":"
./err.sh $@
