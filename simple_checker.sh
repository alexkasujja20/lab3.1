#!/bin/bash
#Script Name: simple_checker.sh
#Author: Alex Kasujja
#Date created: 12/11/2025
#Decription: A script function that scans a small range of ip addresses in a subnet to check which ones are up or down

up() {
    ping -c1 -w1 $ip &>/dev/null && echo "$1 is up" || echo "$1 is down";
} 

ping_sweep() {
  subnet="$1"
  if [ -z "$subnet" ]; then 
    echo "Usage: ping_sweep <subnet-prefix>"
    return 1
  fi
  
  for i in {1..10}; do
    ip="$subnet.$i"
    up "$ip" &
  done
  wait
}
