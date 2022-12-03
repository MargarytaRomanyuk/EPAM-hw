#! /usr/bin/env bash
#echo "enter path to the file with access log"
logs=example_log.log
#f_request_ip (){
#$( cat $logs| cut -d' ' -f1 | sort | uniq -c | sort -nr > reqlog.txt )
max=$( awk '{ print $1 }' $logs | sort | uniq -c | sort -nr | head -1 | awk '{print $2}' )

req_p=$( awk '{ print $7 }' $logs | sort | uniq -c | sort -nr | head -3 )
tim=$( awk '{ print $4 }' $logs | sort | uniq -c | sort -nr | head -4 )
n=$( wc -l < reqlog.txt )
#max=$( head -1 reqlog.txt | awk '{print $2}' )
n_str=$( wc -l < example_log.log )

echo $n
echo $req_p
echo $tim
echo "The most requestes ip were from $max"
#cat reqlog.txt
echo $n_str
