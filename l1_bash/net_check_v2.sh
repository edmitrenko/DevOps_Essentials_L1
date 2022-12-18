#!/bin/bash

ip_list() { #   Usage: ip_list 192.168.0.0/24
    fping -Aaqgr 1 $1
}

ip_ping() {     # Usage: ip_ping 192.168.0.1
    local IP="$1"
    if ping -c1 -w1 "$IP" &>/dev/null; then
        local compname
        compname=$(nbtscan $IP | tail -n +5 | awk '{print $2}')
        echo -ne "$IP\t$compname\n"
    fi
}

ip_scan() {     # Usage: ip_scan 192.168.0.0/24
    export -f ip_ping
    ip_list "$1" | xargs -I {} -P10 bash -c 'ip_ping "$@"' _ {}
    exit 0
}

scan_port() {       # Usage: scan_port 192.168.1.1 80
    local IP="$1"
    local PORT="$2"

#    bash -c "echo > /dev/tcp/${IP}/${PORT}" &>/dev/null && echo "$PORT opened"
    timeout 0.01 bash -c "echo > /dev/tcp/${IP}/${PORT}" &>/dev/null && echo "$PORT opened"
}

port_list() {       # Usage: port_list 192.168.1.1
    local IP="$1"
    export -f scan_port
    seq 0 65535 | xargs -I % bash -c "scan_port $IP %"
    exit 0
}

case "$@" in
        --all[[:space:]][0-9]*\.[0-9]*\.[0-9]*\.[0-9]*\/[0-9]*)
                ip_scan $2
                ;;
        --target[[:space:]][0-9]*\.[0-9]*\.[0-9]*\.[0-9]*)
                port_list $2
                ;;
        *)
                echo -e "\nSYNOPSIS\n$0 --option <target>\n\nDESCRIPTION\nScan a given network for available hosts or scan given host for available ports.\n\n--all\nOutput every available host ip in a <target> subnet.\n--target\nOutput every opened port on a <target> host IP.\n\nEXAMPLES\n$0 --all 192.168.0.0/24\nFind all online hosts in the 192.168.0.0/24 subnet.\n\n$0 --target 192.168.0.10\nFind all available port on a target host.\n"
                ;;
esac


