#!/bin/bash
#Script Name: simple_checker.sh
#Author: Alex Kasujja
#Date created: 12/11/2025
#Decription: A script function that reads a filename and prints only the live IPs found in it

check_ips() {
    file_name="$1"

    if [ -z "$file_name" ]; then
        echo "Usage: check_ips <filename>"
        return 1
    fi

    if [ ! -f "$file_name" ]; then
        echo "Error: File '$file_name' not found."
        return 2
    fi

    echo "Checking IPs in $file_name..."
    > alive_hosts.txt  # clear or create output file

    # Extract IPv4 addresses and check each one
    grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' "$file_name" | while read -r ip; do
        if ping -c1 -W1 "$ip" &>/dev/null; then
            echo "[+] $ip is alive"
            echo "$ip" >> alive_hosts.txt
        fi
    done

    echo "Results saved to alive_hosts.txt"
} 

