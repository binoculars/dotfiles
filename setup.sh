#!/usr/bin/env zsh

dotfiles=${0:A:h}

files=(
    '.alacritty.yml'
	'.bash_profile'
	'.cos'
    '.gitconfig'
	'.gitignore_global'
	'.tmux'
	'.tmux.conf'
	'.tmuxinator'
	'.vim'
	'.vimrc'
	'.zsh'
	'.zshrc'
)

for file in $files; do
	if [[ ! -h "$HOME/$file" ]]; then
		echo "Creating symlink for $file"
		ln -s "$dotfiles/$file" "$HOME/$file"
	fi
done

GH_USERNAME="binoculars"
PROJECTS_DIR=~/Projects
HOME_PROJECTS="$PROJECTS_DIR/home"

repos=(
	'aws-sigv4'
	'aws-sdk-js-on-lambda'
	'aws-lambda-ffmpeg'
	'aws-cloudformation-cognito-identity-pool'
	'IDL-Definitions'
	'bower-register-github-org-repos'
	'dashboard'
)

cd $HOME_PROJECTS

for repo in $repos; do
	if [[ ! -e "./$repo" ]]; then
		git clone git@github.com:${GH_USERNAME}/${repo}.git
	fi
done
