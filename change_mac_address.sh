#!/bin/bash

green='\033[0;32m'
orange='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'

NC='\033[0m'

echo "${green}Running Mac Address Changer"
echo "\tby Gareth George${NC}"
echo "Allows you to change your mac address if blocked by network admins"

echo "${orange}Current Mac Address:${NC}"
ifconfig en1 | grep ether
ifconfig en1 | grep Wi-Fi

echo "${green}Generating a random mac address:${NC}"
macAddr=`openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`
echo "\t$macAddr"

echo "\nNOTE:this might ask for admin privlatges since we're using sudo"
echo "NOTE: if this freezes for more than five seconds press ctrl+c"
echo "press enter to continue"
read
sudo ifconfig en1 ether $macAddr
sudo ifconfig en1 Wi-Fi $macAddr

echo "${green}Your mac address should now be spoofed${NC}"
echo "press enter to run checks and confirm"
read
echo "${green}Your mac address is now...${NC}"
ifconfig en1 | grep ether
ifconfig en1 | grep Wi-Fi

echo "Spoofing complete."