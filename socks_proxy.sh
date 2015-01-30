#!/bin/bash

green='\033[0;32m'
orange='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'

NC='\033[0m'

echo "${green}Running Socks Proxy - SMHS Free Net"
echo "\tby Gareth George${NC}"
echo "${orange}note: you must run credential generator first to setup a login${NC}"


echo "\n${cyan}This program will create a socks proxy to the server configured"
echo "note that the proxy connection will automatically end and revert all settings to normal when this window is closed"
echo "while this script is running all web requests will be routed through a proxy bipassing most filtering attempts${NC}"

echo "Let the fun begin ;)\n"
echo "Please enter the ip or domain name of the server you will tunnel through:"
read remote_host
echo "Please enter your ssh username"
read remote_user

echo "\n${orange}Connecting as ${remote_user}@${remote_host} cancel now if this is incorrect${NC}"
echo "press enter to continue"
read

disable_proxy()
{
        sudo networksetup -setsocksfirewallproxystate Wi-Fi off
        sudo networksetup -setsocksfirewallproxystate Ethernet off
        echo "${red}SOCKS proxy disabled.${NC}"
        echo "\t${red}Script shutdown successfully${NC}"
}
trap disable_proxy INT

echo "Updated network setup to use proxy!"
sudo networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 1080
sudo networksetup -setsocksfirewallproxy Ethernet 127.0.0.1 1080
sudo networksetup -setsocksfirewallproxystate Wi-Fi on
sudo networksetup -setsocksfirewallproxystate Ethernet on

echo "${green}Connecting! This will appear to hang but unless you get an error it's working. I promise.${NC}"
ssh -N -D 0.0.0.0:1080 -i "./.ssh/${remote_host}/id_${remote_user}" ${remote_user}@${remote_host}

