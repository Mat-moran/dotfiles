#!/bin/bash

echo "##################################################"
echo "--> UPDATING THE SYSTEM"
sudo apt-get update
echo "##################################################"
echo "--> INSTALLING neovim"
sudo apt-get install neovim
echo "######"
echo "	To configure neovim:"
echo "	mkdir -p ~/.config/nvim"
echo "	touch ~/.config/nvim/init.vim"
echo "OR"
echo "	Download your init.vim from GitHub repository"
sudo apt-get install curl
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim0

echo "##################################################"
echo "--> INSTALLING fish"
sudo apt-get install fish
curl -L https://get.oh-my.fish | fish
omf install simple-ass-prompt 
# https://www.addictivetips.com/ubuntu-linux-tips/switch-from-bash-to-fish-shell-on-linux/
echo "######"
echo "	To make fish the default terminal execute --> chsh -s /usr/bin/fish"
echo "	To configure fish:"
echo "	mkdir -p ~/.config/fish"
echo "	touch ~/.config/fish/config.fish"
echo "OR"
echo "	Download your config.fish from GitHub repository"
echo "######"

echo "##################################################"
echo "--> INSTALLING git"
sudo apt-get install git
echo "######"
echo "	To configure fish:"
echo "	mkdir -p ~/.config/fish"
echo "	touch ~/.config/fish/config.fish"
echo "######"

echo "##################################################"
echo "--> INSTALLING docker"
# https://docs.docker.com/install/linux/docker-ce/debian/
# Installing packages to allow 'apt' to use a repository over HTTPS
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
# a verification is needed (future implementation)
sudo apt-key fingerprint 0EBFCD88
# Setting a stable repository
# For x86_64 / amd64
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
# install docker engine comunity
sudo apt-get update
sudo apt-get isntall docke-ce docker-ce-cli container.io

echo "##################################################"
echo "--> INSTALLING docker-compose"
# https://docs.docker.com/compose/install/
sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
