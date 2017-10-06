#!/usr/bin/env zsh

alias resrc='source ~/.zshrc'
alias glum='git pull upstream master'
alias glud='git pull upstream develop'
alias cb=git_current_branch

gpo() {
    git push --set-upstream origin $(cb)
}

add-gh-remote() {
    name=$2
    
    if test -z $name; then 
        name="${$(basename `git remote get-url origin`)%.*}"   
    fi

    git remote add "$1" "git@github.com:$1/$name.git"
}

alias gar='add-gh-remote'

gbsuto() {
    git branch --set-upstream-to=origin/$(cb)
}

killport() {
    pid=`lsof -n -i:$1 | tail -1 | awk -F ' ' '{print $2}'`;

    if ! test -z $pid; then
        echo "Killing $pid on port $1";
        kill $pid;
    else
        echo 'No process to kill';
    fi
}

alias d='docker'
alias dcomp='docker-compose'
alias dsync='docker-sync'
alias cdh='cd ~'
alias 'cd.'='cd $dotfiles'
alias 'show-all-files'='defaults write com.apple.finder AppleShowAllFiles YES'
alias 'hide-all-files'='defaults write com.apple.finder AppleShowAllFiles NO'

dcomp-ut() {
	dcomp up -d $1 && dcomp logs -f --tail $2 $1
}

alias av=ansible-vault
alias tf=terraform
