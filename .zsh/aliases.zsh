alias gpum='git pull upstream master'
alias gpud='git pull upstream develop'
alias cb='git rev-parse --abbrev-ref HEAD'

gpo() {
    git push origin $(cb)
}

add-gh-remote() {
    git remote add $1 git@github.com:$1/$2.git
}

gbsuto() {
    git branch --set-upstream-to=origin/$(cb)
}