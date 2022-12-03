#! /usr/bin/env bash

#A. Create a script that uses the following keys:
#1. When starting without parameters, it will display a list of possible keys and their description.
#2. The --all key displays the IP addresses and symbolic names of all hosts in the current subnet
#3. The --target key displays a list of open system TCP ports.
#The code that performs the functionality of each of the subtasks must be placed in a separate functio

#echo "Please, choise a key: --all; --target"
# ip add  > ipadd.txt
arp -a  > ipadd.txt
#grep 'inet 1' ipadd.txt  > ipad.txt
grep 'ether' ipadd.txt | cut -d ' ' -f2  > ipad.txt
cat ipad.txt
 

