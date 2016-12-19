#!/bin/zsh

dotfiles=${0:A:h}

ln -s $dotfiles/.bash_profile ~/.bash_profile
