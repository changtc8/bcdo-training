#!/bin/bash
# add -x optioin to bash to get output of what the actual command
#  such as !/bin/bash -x
#
# script to run three shell bash, ksh, sh 
# argument are command; run shell with -c option
# for each shell give follow:
#   The name of the shell being tried (bash, ksh, or sh).
#   The exit status from the command.
#   The combined stdout/stderr of the command, in square brackets.
#
# test:
#   redir 'echo hello'
#
# result:
#   bash: status=0 [hello]
#   ksh: status=0 [hello]
#   sh: status=0 [hello]
#
# test2:
#  redir 'echo hello >& /dev/null'
#
bash -c "$1" > log
echo "bash: status=$? [`cat log`]"
log=`ksh -c "$1"`
echo "ksh: status=$? [${log}]"
sh -c "$1" > log
echo "sh: status=$? [`cat log`]"



