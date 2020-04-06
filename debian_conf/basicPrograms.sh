#!/bin/bash
set -e

echo "#########################################################"
echo "After installation script to set up and install programs"
echo "#########################################################"

# Verify 
su - $user
echo groups

sudo apt-get update
sudo apt-get install fish
sudo apt-get install neovim
sudo apt
