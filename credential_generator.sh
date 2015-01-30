#!/bin/bash

green='\033[0;32m'
orange='\033[1;33m'
cyan='\033[1;36m'

NC='\033[0m'

echo "${green}Running Proxy Credential Generator"
echo "\tby Gareth George${NC}"
echo "${orange}DO NOT RUN THIS MORE THAN ONCE FOR ANY GIVEN HOST${NC}"
echo "${cyan}This program allows you to use a secure ssh key to login to a remote server"
echo "instead of having to type your password every time${NC}"

echo "Please provide the remote host ip / domain:"
read remote_host
echo "\nEnter User Name:"
read user_name
#echo "Enter ssh-key passphrase (this is not the user's password), you can leave this blank"
#read ssh_key_passphrase

echo "\n${orange}Creating the SSH Key:${NC}"
mkdir "./.ssh"
mkdir "./.ssh/${remote_host}"
ssh-keygen -f "./.ssh/${remote_host}/id_$user_name" -N "" #-N $ssh_key_passphrase

echo "\n${green}Key Creation Complete${NC}"

echo "\tPress any key to continue"
echo "\n\n${cyan}In this next step the ssh key you created will be uploaded to the server's ssh key chain this will allow you to connect to the server by providing your private key${NC}\n"

echo "Connecting as ${user_name}@${remote_host} cancel now if this is incorrect"
echo "press any key to continue"
read
echo "\n${orange}You will be prompted for a password as this script must ssh into the remote server${NC}"
cat "./.ssh/${remote_host}/id_${user_name}.pub" | ssh ${user_name}@${remote_host} 'mkdir -p ~/.ssh && cat > ~/.ssh/authorized_keys'


echo "${green}DONE! Successfully added your credentials to the remote server\n\tFeel free to run socks_proxy.sh now${NC}"