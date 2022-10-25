#! /usr/bin/env bash
#echo "enter path to the file with access log"
logs=example_log.log
echo "input number of quatijns (1 ... 6)"
read num
all_req=$( cat $logs | cut -d' ' -f1 | sort | uniq -c | sort -nr | awk 'BEGIN { print "IP", "\t", "requests\n" } { print $2, "\t",  $1 }' )
      
non_ex=$( cat apache_logs.txt | grep "error404" | sort | uniq -c | sort -nr )
bots=$( cat $logs | grep "bot" | sort | uniq -c | sort -nr | head -5 )

f_request (){
awk -v a=$num '{ print $a }' $logs | sort | uniq -c | sort -nr | head -2 | awk '{print $2}'
}
case $num in
	1) echo "The most requestes ip were from $( f_request ) " ;;
	7) echo "The most requested page is $( f_request ) " ;;
	4) echo "The most requests get in time $( f_request ) " ;;
	3) echo "requests from each ip "\n"  $all_req" ;;
	6) echo "6) $bots" ;;
	*) echo "4) $non_ex"

esac
