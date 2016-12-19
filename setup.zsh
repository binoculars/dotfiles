#!/bin/zsh

dotfiles=${0:A:h}

ln -s $dotfiles/.bash_profile ~/.bash_profile

#export GH_USERNAME = "binoculars"
#export PROJECTS_DIR = ~/Projects
#export HOME = $PROJECTS_DIR/home

#cd $HOME

#git clone git@github.com:$GH_USERNAME/$REPO.git
