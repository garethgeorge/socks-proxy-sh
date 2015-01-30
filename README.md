# socks-proxy-sh
Shell Scripts for bipassing network restrictions

# Description
Excessively restrictive network limitations are intended to prevent inappropriate network use yet more often than not they seem interfere with using the network at all.
Page filters that scan html and check urls flagged for inappropriate content serve their purpose but slow down browing by orders of magnitude.
Annoying blocked pages frequently catch sites that shouldn't even be blocked in the first place.

The scripts provided in this repository are intended as example code demonstrating the ability to change mac addresses, ssh tunnel through a secure socks proxy, and manage ssh connections to remote servers.


# The Scripts

## socks_proxy.sh
Running the script is extremely simple. Just open your terminal and type
```shell
sh socks_proxy.sh
```
and you should be welcomed by a prompt. 

This script requires that you have a username and password for a remote server that is configured to listen for ssh requests on port 443.


## change_mac_address.sh
Running this script is extremely simple. Just open your terminal and type
```shell
sh change_mac_address.sh
```
and you will be welcomed by a prompt.

Anyone can use this script. It will simply change your mac address to a randomized one effectively giving you a clean slate new identity on the network. This means if your mac address has been blocked in the past you will be able to browse again! Make sure to turn your wifi off before running this script and re-enable it afterwards. I will likely automate this action in the future but right now it must be done manually.

## credential_generator.sh

Running the script is extremely simple. Just open your terminal and type
```shell
sh socks_proxy.sh
```
and you should be welcomed by a prompt. 

Anyone with a server that accepts ssh requests can use this script really. It is intended to simplify the process of connecting to your proxy server by elimonating the need to enter a password.
Simply connect the script to your server's host address and user account. It will generate an ssh key in ./.ssh/<host addr>/id_<username> and automatically upload the public key to the list of allowed accounts on the remote server.
Once this is completed the socks_proxy.sh script is configured to automatically check for and load private key authentication files when they are avaliable.
