#!/bin/bash
#Script Name: ping_sweep.sh
#Author: Alex Kasujja
#Date created: 24/10/2025
#Decription: A script function that scans a small range of ip addresses in a subnet accepts subnet prefix to check which ones are alive.


ping_sweep() {
  subnet="$1"
  for i in {1..10}; do
    ip="$subnet.$i"
    (ping -c1 -w1 $ip &>/dev/null && echo "[+] $ip alive") &
    done
    wait
}
ping_sweep