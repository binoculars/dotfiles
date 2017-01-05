#!/bin/zsh

dotfiles=${0:A:h}

dfiles=`ls -a $dotfiles | grep "^\\.[^.].\+[^(.git|.swp|.editorconfig)]$"`

for file in $dfiles; do
	if [[ ! -e "~/$file" ]]; then
		ln -s "$dotfiles/$file" "~/$file"
	fi
done

GH_USERNAME="binoculars"
PROJECTS_DIR=~/Projects
HOME="$PROJECTS_DIR/home"

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
	if [[ ! -e "./$repo" ]]; then
		git clone git@github.com:${GH_USERNAME}/${repo}.git
	fi
done
