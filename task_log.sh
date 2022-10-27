#! /usr/bin/env bash
#echo "enter path to the file with access log"
echo "Using Apache log the script to answer the following questions:"\n" 1. From which ip were the most requests? "\t" coise 1 "\n" 2. What is the most requested page? "\t" coise 7 3. How many requests were there from each ip? "\n"
4. What time did site get the most requests?  "\t" coise 4 '\n" 5. What non-existent pages were clients referred to? "\t" coise 5 "\n" 6. What search bots have accessed the site? (UA + IP) "\t" coise 6"
logs=example_log.log
echo "Input number of your choise"
read num
all_req=$( cat $logs | cut -d' ' -f1 | sort | uniq -c | sort -nr | awk 'BEGIN { print "IP", "\t", "requests\n" } { print $2, "\t",  $1 }' )
      
non_ex=$( cat apache_logs.txt | grep "error404" | sort | uniq -c | sort -nr )
bots=$(awk -F'|' '!/Applebot|Googlebot|bingbot|YandexBot|SentiBot|AhrefsBot/{print $1 $5 $11}' $logs | sort -nr | uniq -c | head -30 )
#bots=$(cat $logs | awk -F'|' '{print $5 $11 $1}' | grep -F -v -e "Googlebot" -e "bingbot" -e "Applebot" | sort -n | uniq -c | sort -nr | head -30 )

f_request (){
awk -v a=$num '{ print $a }' $logs | sort | uniq -c | sort -nr | head -2 | awk '{print $2}'
}
case $num in
	1) echo "The most requestes ip were from $( f_request ) " ;;
	7) echo "The most requested page is $( f_request ) " ;;
	3) echo "requests from each ip "\n"  $all_req" ;;
	4) echo "The most requests get in time $( f_request ) " ;;
	5) echo "Clients referred to non-existent pages: $non_ex"
	6) echo "Search bots have accessed the site $bots" ;;
	

esac
