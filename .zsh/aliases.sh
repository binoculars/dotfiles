alias gpum='git pull upstream master'
alias gpud='git pull upstream develop'
alias cb=git_current_branch

gpo() {
    git push origin $(cb)
}

add-gh-remote() {
    git remote add $1 git@github.com:$1/$2.git
}

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