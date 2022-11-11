#! /bin/bash

echo "script name is $0"
echo "all arguments are: $*"

# also can be used for printing all arguments:
# echo $@
# for i in "$@":; do
#     echo $i
# done

echo "number of arguments is $#"
echo "2nd is $2 and 4th is $4"
[[ $2 -eq $1 ]]
echo "execution of last comand is $?"

