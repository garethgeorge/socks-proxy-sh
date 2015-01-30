#!/bin/bash

green='\033[0;32m'
orange='\033[1;33m'
cyan='\033[1;36m'
red='\033[1;31m'

NC='\033[0m'

echo "${green}Running Credential Adder"
echo "\tby Gareth George${NC}"
echo "Automatically loads your ssh-keys and adds them so you can use them!"

echo "\nEnter remote host:"
read remote_host

echo "Enter user name:"
read remote_user

echo "\nAttempting to add ssh key"
ssh-add ".ssh/${remote_host}/id_${remote_user}"

echo "${green}Added key!${NC}\n"
echo "ssh-add now has the following keys"
ssh-add -l
echo "${green}DONE${NC}\n"