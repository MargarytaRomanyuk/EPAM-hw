#! /usr/bin/env bash

#A. Create a script that uses the following keys:
#1. When starting without parameters, it will display a list of possible keys and their description.
#2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
#3. The --target key displays a list of open system TCP ports.
#The code that performs the functionality of each of the subtasks must be placed in a separate function
#In this code is used nmap command. 

ip addr | grep global | awk '{ print $2 }' > ipaddr.txt
touch file1.txt file2.txt

# Function for listing opened TCP ports:
function openedTCP
{
nmap -sT -iL ipaddr.txt | grep open
}

# Functions for showing IP addresses and symbolic names of all hosts in the current subnet
function ipscan
{
sudo nmap -sP -iL ipaddr.txt | grep report |awk 'BEGIN { print "Ip addresses" } { print $5 }'  | sed '$d'
}

function hostscan
{
sudo nmap -sP -iL ipaddr.txt | grep MAC |awk 'BEGIN { print "symbolic names:"  } { print $4, $5, $6 }'
}

case $1 in 
  "--all" )
	echo "you choose key --all"
	ipscan > file1.txt
	hostscan > file2.txt
	paste file1.txt file2.txt
	rm file1.txt
	rm file2.txt
	hostname -I | tr '\n' \\t; hostname -f | awk '{ print $1 }'
	;;
   "--target" ) 
	echo "you choose key --target:"
	openedTCP
	;;
	*) echo "Please, choose a key:
 --all - key displays the IP addresses and symbolic names of all hosts in the current subnet
 --target -key displays open system TCP ports"
 	;;
esac

