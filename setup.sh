#!/usr/bin/env zsh

dotfiles=${0:A:h}

files=(
	'.bash_profile'
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
	fp="$HOME/$file"
	# -h file
	# 	true if file exists and is a symbolic link.
	if [[ ! -h ${fp} ]]; then
		# -f file
		# 	true if file exists and is a regular file.
		# -d file
		# 	true if file exists and is a directory.
		if [[ -f ${fp} ]] || [[ -d ${fp} ]]; then
			echo "Backing up ${file}"
			mv ${fp} "${fp}.bak"
		fi
		echo "Creating symlink for ${file}"
		ln -s "${dotfiles}/${file}" ${fp}
	else
		echo "Symlink already exists for ${file}"
	fi
done

exit 0;

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
