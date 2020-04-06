#!/bin/bash

echo "##################################################"
echo "--> UPDATING THE SYSTEM"
sudo apt-get update
echo "##################################################"
echo "##################################################"
command -v curl &> /dev/null
if [ $? != 0 ]
then
    echo "--> INSTALLING curl"
    sudo apt-get install curl
else
    echo "--> curl ALREADY INSTALLED"
fi
echo "##################################################"
echo "##################################################"
command -v nvim &> /dev/null
if [ $? != 0 ]
then
    echo "--> INSTALLING neovim"
    sudo apt-get install neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim0
else
    echo "--> neovim ALREADY INSTALLED"
fi
echo "######"
echo "	To configure neovim:"
echo "	mkdir -p ~/.config/nvim"
echo "	touch ~/.config/nvim/init.vim"
echo "OR"
echo "	Download your init.vim from GitHub repository"

echo "##################################################"
echo "##################################################"
# https://www.addictivetips.com/ubuntu-linux-tips/switch-from-bash-to-fish-shell-on-linux/
command -v fish &> /dev/null
if [ $? != 0 ]
then
    echo "--> INSTALLING fish"
    sudo apt-get install fish
else
    echo "--> fish ALREADY INSTALLED"
fi
echo "##################################################"
echo "######"
echo "	To make fish the default terminal execute --> chsh -s /usr/bin/fish"
echo "	To configure fish:"
echo "	mkdir -p ~/.config/fish"
echo "	touch ~/.config/fish/config.fish"
echo "OR"
echo "	Download your config.fish from GitHub repository"
echo "######"

echo "##################################################"
echo "##################################################"
command -v git &> /dev/null
if [ $? != 0 ]
then
    echo "--> INSTALLING git"
    sudo apt-get install git
else
    echo "--> git ALREADY INSTALLED"
fi

echo "##################################################"
echo "##################################################"
# https://www.addictivetips.com/ubuntu-linux-tips/switch-from-bash-to-fish-shell-on-linux/
command -v docker &> /dev/null
if [ $? != 0 ]
then
    # https://docs.docker.com/install/linux/docker-ce/debian/
    # Installing packages to allow 'apt' to use a repository over HTTPS
    echo "--> INSTALLING docker"
    sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
    # Add Docker's official GPG key
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
    # a verification is needed (future implementation)
    sudo apt-key fingerprint 0EBFCD88
    # Setting a stable repository
    # For x86_64 / amd64
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    # install docker engine comunity
    sudo apt-get update --fix missing
    sudo apt-get install docker-ce docker-ce-cli containerd.io
else
    echo "--> docker ALREADY INSTALLED"
fi
echo "##################################################"
command -v docker-compose &> /dev/null
if [ $? != 0 ]
then
    echo "--> INSTALLING docker-compose"
    # https://docs.docker.com/compose/install/
    sudo curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
else
    echo "--> docker-compose ALREADY INSTALLED"
fi

