#!/bin/bash
# take a single argument and print why variable contain that string need quote
#
# test:
#   whyq ''
#   whyq 'a string with  spaces'
#   whyq '*junk*'
#   whyq 'spaces and ?'
#   whyq '"'
#   whyq ']'
#   whyq ordinary
#
# result:
#    [] is the empty string
#    [a string with  spaces] contains whitespace
#    [*junk*] contains globchars
#    [spaces and ?] contains whitespace
#    [spaces and ?] contains globchars
#    ["] is not special
#    []] contains globchars
#    [ordinary] is not special
#   
str=$1
len=${#str}

for (( i=0; i<${len}; i++ )); do
#  echo "${str:$i:1}"
  case ${str:$i:1} in
    ' ') ws=1
         ;;
    '*') glob=1
         ;;
    '?') glob=1
         ;;
    '!') glob=1
         ;;
    ']') glob=1
         ;;
    '[') glob=1 
         ;;
    '{') glob=1
         ;;
    '}') glob=1
         ;;
    *) ord=1
         ;;
  esac
done
echo " ord=${ord} ws=${ws} glob=${glob} "
one=1
if [[ $len -eq 0 ]]; then
  echo "[$1] is the empty string"
elif [[ ${glob} == $one ]]; then
   echo "[$1] contains globchars"
elif [[ $ord == $one ]]; then
     echo "[$1] is not special"
fi
if [[ $ws == $one ]]; then
     echo "[$1] contains whitespace"
fi  
