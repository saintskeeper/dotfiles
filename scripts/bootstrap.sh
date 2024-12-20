#!/usr/bin/env bash

# set of functions to remove and replace dotfiles

# remove dotfiles
function remove_dotfiles(){
		rm -rf ~/.aliases
    rm -rf ~/.bash_profile
    rm -rf ~/.bash_prompt
    rm -rf ~/.bashrc
    rm -rf ~/.functions
    rm -rf ~/.profile
}


function move_dotfiles(){
		cp .aliases ~/.aliases
    cp .bash_profile ~/.bash_profile
    cp .bash_prompt ~/.bash_prompt
    cp .bashrc ~/.bashrc
    cp .functions ~/.functions
    cp .profile ~/.profile
		cp -r .config ~/.config
}

