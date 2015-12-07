#!/bin/bash

function update_cache() {
	echo "update apt cache"
	apt-get update
}

function gen_ssh_key() {
	echo "enter ssh_key folder"
	mkdir ssh_key
	cd ssh_key
	ssh-keygen -b 2048 -t rsa -q -N "" -f $SUDO_USER
	cd ..
}

function install_apps() {
// list about app name I need to install
echo "INSTALLING ESSENTIALS"

list=(	git-core
	curl
	wget
	vim
	zsh
	build-essential)

for i in "${list[@]}"
do
	printf "Installing %s\n" "$i"
	apt-get install -y $i
	printf "=========Done install $i =============\n"
done


echo "Finish Essential apps"
}

function install_oh_my_zsh() {

dir = eval echo"/home/$SUDO_USER"
cd $dir
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}


echo "Start Setup"

gen_ssh_key
update_cache
install_apps
install_oh_my_zsh
