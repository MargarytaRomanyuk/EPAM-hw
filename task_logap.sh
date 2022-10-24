#! /usr/bin/env bash
#echo "enter path to the file with access log"
logs=apache_logs.txt
#f_request_ip (){
cat $logs| cut -d' ' -f1 | sort | uniq -c | sort -nr  > reqlog.txt 
n=$( wc -l < reqlog.txt )
max=$( head -1 reqlog.txt | awk '{print $2}' )

#cat reqlog.txt  sort -r | awk '{printf("%s ", $0)}' > m
	#declare -a m 
	#max=${m[1]}
	#for i in n
	#do 
	#    if 
echo $n
echo "The most requestes ip were from $max"
#cat reqlog.txt
