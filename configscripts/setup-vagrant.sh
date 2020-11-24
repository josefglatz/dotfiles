#!/usr/bin/env bash

if test $(which vagrant); then
    echo "Setup vagrant environment now" | lolcat
    source ~/.extra
    echo "Vagrant Cloud Status:"
    vagrant cloud auth login --check

    read -p "Do you want to (re)authenticate your vagrant environment at vagrant cloud? [y/n] " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        vagrant login
    fi

    read -p "Do you want to install the following vagrant plugin? (vagrant-hostmanager) [y/n] " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        vagrant plugin install vagrant-hostmanager
    fi

    # @TODO: add vagrant-parallels check if parallels is already installed
    read -p "Do you want to install the following vagrant plugin? (vagrant-parallels) Parallels Desktop needs to be installed (and licensed) [y/n] " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        vagrant plugin install vagrant-parallels
    fi
    
fi
