#! /bin/bash
echo "script name is $0"
echo "all arguments are: $*"
echo "number of arguments is $#"
echo "2nd is $2 and 4th is $4"
[[ $2 -eq $1 ]]
echo "exwcution of last comand is $?"

