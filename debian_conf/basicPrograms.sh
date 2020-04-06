#!/bin/bash
set -e

echo "#########################################################"
echo "After installation script to set up and install programs"
echo "#########################################################"

# Give root permisons to the current user 
# from https://devconnected.com/how-to-add-a-user-to-sudoers-on-debian-10-buster/
su
user=whoami
sudo usrmod -a -G sudo $user
exit

# Verify 
su - $user
echo groups

sudo apt-get update
sudo apt-get install fish
sudo apt-get install neovim
sudo apt
