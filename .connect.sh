#!/bin/bash
erg=$(nmap -sL 130.83.139.0/24 | grep 'raspberrypi' | awk '{print $6}'| grep -o '[^(].*[^)]' )
echo "Connect to $erg"
sshfs pi@$erg:/home/pi/workspace/ /home/seb/rasp -o reconnect -C -o workaround=all -p 22
