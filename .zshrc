export dotfiles=${$(readlink ~/.zshrc):A:h}

LANG="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"
#ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='nerdfont-complete'
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	osx
	bower
	brew
	aws
	git-extras
	git-flow
	github
	gitignore
	node
	npm
	nvm
	python
	pip
	pep8
	screen
	sudo
	tmux
	tmuxinator
	docker
	go
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

bindkey \^U backward-kill-line
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

export DEFAULT_USER=${USER}
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# Virtualenvs
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
export AUTOENV_ENV_FILENAME='.autoenv'
#source /usr/local/bin/virtualenvwrapper.sh
source /usr/local/opt/autoenv/activate.sh

source ~/.zsh/aliases.sh

# added by travis gem
[ -f /Users/barrettharber/.travis/travis.sh ] && source /Users/barrettharber/.travis/travis.sh
source $HOME/.cargo/env
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"

# export PATH="$HOME/.yarn/bin:$PATH"
source <(kubectl completion zsh)

GPG_TTY=$(tty)
export GPG_TTY

if test -f ~/.gnupg/.gpg-agent-info -a -n "$(pgrep gpg-agent)"; then
    source ~/.gnupg/.gpg-agent-info
    export GPG_AGENT_INFO
    GPG_TTY=$(tty)
    export GPG_TTY
else
    eval $(gpg-agent --daemon --write-env-file ~/.gnupg/.gpg-agent-info)
fi

export PATH=$PATH:/usr/local/go/binexport GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export EDITOR='vim'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/barrettharber/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/barrettharber/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/barrettharber/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/barrettharber/google-cloud-sdk/completion.zsh.inc'; fi
fpath=(/usr/local/share/zsh-completions $fpath)


export PATH="/usr/local/opt/openssl/bin:$PATH"
