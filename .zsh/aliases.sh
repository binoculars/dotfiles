#!/usr/bin/env zsh

alias resrc='source ~/.zshrc'
alias glum='git pull upstream master'
alias gfum='git fetch upstream master'
alias glud='git pull upstream develop'
alias gfud='git fetch upstream develop'
alias cb=git_current_branch

gpsu() {
    git push --set-upstream ${1:-origin} $(cb)
}

alias gpo=gpsu

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
alias 'cd-gt'='cd $(git rev-parse --show-toplevel)'
alias 'cdgr'='cd-gt'
alias 'show-all-files'='defaults write com.apple.finder AppleShowAllFiles YES'
alias 'hide-all-files'='defaults write com.apple.finder AppleShowAllFiles NO'

dcomp-ut() {
	dcomp up -d $1 && dcomp logs -f --tail $2 $1
}

alias av=ansible-vault
alias tf=terraform

function sri() {
  curl -s "${2}" | openssl dgst "-sha${1}" -binary | openssl base64 -A | (echo -n "sha${1}-" && cat) | pbcopy
  echo Copied "SHA${1}" into your clipboard
  pbpaste
  echo
}

function cert-dates() {
  DOMAIN=$1
  echo | openssl s_client -connect ${DOMAIN}:443 -servername ${DOMAIN} 2>/dev/null | openssl x509 -noout -issuer -dates
}

