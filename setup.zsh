#!/bin/zsh

dotfiles=${0:A:h}

ln -s $dotfiles/.bash_profile ~/.bash_profile

GH_USERNAME="binoculars"
PROJECTS_DIR=~/Projects
HOME=$PROJECTS_DIR/home

repos=(
	'aws-sigv4'
	'aws-sdk-js-on-lambda'
	'aws-lambda-ffmpeg'
	'aws-cloudformation-cognito-identity-pool'
	'IDL-Definitions'
	'bower-register-github-org-repos'
	'dashboard'
)

cd $HOME

for repo in $repos; do
	git clone git@github.com:${GH_USERNAME}/${repo}.git
done
