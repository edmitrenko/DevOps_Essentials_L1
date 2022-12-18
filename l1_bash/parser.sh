#!/usr/bin/env bash

# Using Apache log example create a script to answer the following questions:
# 1. From which ip were the most requests?
# 2. What is the most requested page?
# 3. How many requests were there from each ip?
# 4. What non-existent pages were clients referred to?
# 5. What time did site get the most requests?
# 6. What search bots have accessed the site? (UA + IP)

LOG_FILE="$1"

#1.From which ip were the most requests?
function most_request_ip() {
    declare -A ip_array
    while read line; do
        ip=$(echo $line | awk '{print $1}')
        for x in $ip;
        do
                ip_array[$x]=$((ip_array[$x]+1))
        done;
    done < $LOG_FILE

    for ip in ${!ip_array[@]}; do echo  "${ip_array[$ip]} requests from ip $ip"; done | sort -rnk1 | head -1
}
#2.What is the most requested page?
function most_request_pages() {
    declare -A page_array
    while read line; do
            page=$(echo $line | cut -f7 -d" " | awk '/.*(html|ico|png|php|" ")/{print $0}')
        for x in $page;
        do
                page_array[$x]=$((page_array[$x]+1))
        done;
    done < $LOG_FILE
    for page in ${!page_array[@]}; do echo The most requested page is $page - the ${page_array[$page]} requests; done | sort -rnk9 | head -10
}

#3.How many requests were there from each ip?
function request_per_ip() {
    declare -A ip_array
    while read line; do
        ip=$(echo $line | awk '{print $1}')
        for x in $ip;
        do
                ip_array[$x]=$((ip_array[$x]+1))
        done;
    done < $LOG_FILE


    for ip in ${!ip_array[@]}; do echo  ${ip_array[$ip]} requests from  $ip; done | sort -rn 
    echo ""
}

#What non-existent pages were clients referred to?
function unknown_pages() {
    declare -A unknown_page_array
    while read line; do
        unknown_page=$(echo $line | grep '" 404' | cut -f7 -d" ")
        for x in $unknown_page;
        do
                unknown_page_array[$x]=$((unknown_page_array[$x]+1))
        done;
    done < $LOG_FILE
    for unknown_page in ${!unknown_page_array[@]}; do echo ${unknown_page_array[$unknown_page]} requests to unknown page -  $unknown_page; done | sort -rn
}

#What time did site get the most requests?
function time_most_requests() {
cat $LOG_FILE  | awk -v FPAT='(\"[^"]+\")|(\\[[^]]+])|([^ ]+)' '{gsub(".*GET", "", $5); gsub("HTTP.*", "", $5); gsub("\"", "", $9); gsub("\\[","",$4);; gsub("\\:[0-9]{2}.?\\+[0-9]{4}.*$","",$4); printf "%s to page:%s\n", $4, $5 }' | sort -k1 | uniq -c | sort -rn | head -1 > /tmp/time_requests
while read line; do
        echo $line
done < /tmp/time_requests

rm -rf /tmp/time_requests
}


#What search bots have accessed the site? (UA + IP)
function bots() {
cat $LOG_FILE | grep -E  'bot|Bot' | awk -v FPAT='(\"[^"]+\")|(\\[[^]]+])|([^ ]+)' '{ gsub(".*GET", "", $5); gsub("HTTP.*", "", $5); gsub("\"", "", $9); printf "IP:%s\nRequest:%s\nUser-Agent:%s\n%s\n", $1, $5, $9,"-------" }' > /tmp/bots
while read line; do
        echo $line
done < /tmp/bots

rm -rf /tmp/bots
}


echo -e "Input parameter for parsing Apache log\nAvailable parameters are:\n"


while true; do
echo ""
echo -e "(1) From which ip were the most requests?\n(2) What is the most requested page?\n(3) How many requests were there from each ip?\n(4) What non-existent pages were clients referred to?\n(5) What time did site get the most requests?\n(6) What search bots have accessed the site? (UA + IP)\n(Exit) Exit"	
echo ""
read -p "Get the choice: "  var
	case $var in
        1)
                most_request_ip
                ;;
        2)
                most_request_pages
                ;;
	 3)
                request_per_ip
                ;;
        4)
                unknown_pages
                ;;
	 5)
		time_most_requests
		;;	
        6)
                bots
                ;;
	7)
		request_pages
		;;	
	[A-Za-z]xit)
		exit
		;;
esac
done

