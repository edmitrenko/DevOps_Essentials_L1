#/bin/enf bash

function net() {

	nmap -sP -R $1 > /tmp/net
	while read line; do
        echo $line | awk '/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/{gsub("\\(", "", $6); gsub("\\)", "", $6); printf "%s   %s%s\n", $5,$6,""}'
	done < /tmp/net

	rm -rf /tmp/net
}


function ip() {
	nmap -sT $1 | awk '/(^[0-9]+\/tcp)|(^PORT.+)/{ printf "%-10s %-10s %s\n", $1, $2, $3 }'
}

case "$@" in
	--all[[:space:]][0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\/[0-9]*)
                net $2
                ;;
	--target[[:space:]][0-9]*\.[0-9]*\.[0-9]*\.[0-9]*)
                ip $2
                ;;
        *)
		echo "Input parameters: [--all|--target] destination"
                ;;
esac

