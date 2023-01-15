#! /usr/bin/env bash
echo "enter path to the file with access logs"
read logs
echo "Using Apache log the script answers to  the following questions:
1. From which ip were the most requests?		 coise 1
2. What is the most requested page?			 coise 7 
3. How many requests were there from each ip?	 	 coise 3
4. What time did site get the most requests?    	 coise 4
5. What non-existent pages were clients referred to?  	 coise 5
6. What search bots have accessed the site? (UA + IP)	 coise 6"

echo "Input number of your choise"
read num

all_req=$( cat $logs | cut -d' ' -f1 | sort | uniq -c | sort -nr | awk 'BEGIN { print "IP", "\t\t", "requests" } { print $2, "\t ",  $1 }' )
non_ex=$( cat $logs | grep "error404" | sort | uniq -c | sort -nr )
bots=$(awk -F'|' '!/Applebot|Googlebot|bingbot|YandexBot|SentiBot|AhrefsBot/' $logs | sort | uniq -c | sort -nr | awk 'BEGIN { print "UA", "\t\t", "IP" } { print $13, "\t ",  $2 }' | uniq )

f_request ()
{
awk -v a=$num '{ print $a }' $logs | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'
}
case $num in
	1) echo "The most requestes ip were from $( f_request ) " ;;
	7) echo "The most requested page is $( f_request ) " ;;
	3) echo "All requests from each ip: 
$all_req" ;;
	4) echo "The most requests get in time $( f_request ) " ;;
	5) if [[ -n $non_ex ]] ; then echo "Clients referred to non-existent pages: 
$non_ex"
	   else echo "Clients didn't refer to non-existent pages"
	   fi ;;
	6) echo "Search bots have accessed the site
$bots" ;;
esac
