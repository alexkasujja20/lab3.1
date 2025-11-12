#!/bin/bash
#Script Name: simple_checker.sh
#Author: Alex Kasujja
#Date created: 12/11/2025
#Decription: A script function that encrypts words.

rot13() {
    echo "$1" | tr 'A-Za-z' 'N-ZA-Mn-za-m'

}