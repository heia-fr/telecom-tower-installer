#!/bin/bash

echo "**********************************************************************"
echo '*  _____    _                            _____                       *'
echo '* |_   _|__| | ___  ___ ___  _ __ ___   |_   _|____      _____ _ __  *'
echo '*   | |/ _ \ |/ _ \/ __/ _ \| '\''_ ` _ \    | |/ _ \ \ /\ / / _ \ '\''__| *'
echo '*   | |  __/ |  __/ (_| (_) | | | | | |   | | (_) \ V  V /  __/ |    *'
echo '*   |_|\___|_|\___|\___\___/|_| |_| |_|   |_|\___/ \_/\_/ \___|_|    *'
echo '*                                                                    *'
echo '*       Haute école d'\''ingéneirie et d'\''architecture de Fribourg       *'
echo "*                                                                    *"
echo "**********************************************************************"

if [ $USER != 'pi' ]; then
    echo "ERROR: This script is supposed to be run as the pi user"
    exit 1
fi

if [ ! /usr/bin/git ]; then
	echo "Installing git"
	sudo apt-get update
	sudo apt-get install git
fi

mkdir -p $HOME/git/github.com/ansible
cd $HOME/git/github.com/ansible

if [ -d ansible ]; then
	cd ansible
	git pull
else
	git clone https://github.com/ansible/ansible.git --recursive
	cd ansible
fi
source ./hacking/env-setup

echo "READY..."