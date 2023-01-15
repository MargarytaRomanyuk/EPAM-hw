#! /usr/bin/env bash

#A. Create a script that uses the following keys:
#1. When starting without parameters, it will display a list of possible keys and their description.
#2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
#3. The --target key displays a list of open system TCP ports.
#The code that performs the functionality of each of the subtasks must be placed in a separate functio

echo "Please, choise a key: --all; --target"
# Function for listing opened TCP ports:
function openedTCP
{
netstat -tln | grep LISTEN
}
# Function for showing IP addresses and symbolic names of all hosts in the current subnet
function netscan
{
arp -a | grep ether | awk 'BEGIN { print "ip addresses", "\t", "symbolic names" } { print $2, "\t", $1 }' 
}

case $1 in 
  "--all" )
	echo "you choose key --all"
	netscan
	hostname -I | tr '\n' \\t; hostname -f | awk '{ print $1 }'
    ;;
   "--target" ) 
	echo "you choose key --target:"
	openedTCP
    ;;
	*) echo "Please, choise a key:
 --all - key displays the IP addresses and symbolic names of all hosts in the current subnet
 --target -key displays open system TCP ports"
    ;;
esac

