# my bash stuff!

# emacs
alias e=emacs

## cdu
alias aws-login="eval $(aws ecr get-login)"
alias tn="$HOME/tn.sh"

## aliases
alias ls="ls -G"
alias mk="minikube"

alias t="/usr/local/Cellar/todo-txt/2.10/bin/todo.sh"
export TODOTXT_DEFAULT_ACTION=ls
### set locations
export TODO_DIR="/Users/401174/Dropbox/todo"
export TODO_FILE="$TODO_DIR/todo.txt"
export DONE_FILE="$TODO_DIR/done.txt"
export REPORT_FILE="$TODO_DIR/report.txt"
export TODOTXT_DEFAULT_ACTION=ls

### smart sort
export TODOTXT_SORT_COMMAND='env LC_COLLATE=C sort -f -k2'

## Git branch in prompt.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $"
export PATH="/usr/local/sbin:$PATH"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

## brew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

## brew packages
### direnv
#### enable direnv hook for .envrc files
eval "$(direnv hook bash)"

## golang
export PATH=$HOME/go/bin:/usr/local/opt/go/libexec/bin:$PATH
export GOROOT=/usr/local/Cellar/go/1.8.1

## node version manager
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"

## ruby environment manager
if [ -f $(brew --prefix)/bin/rbenv ]; then
 export RBENV_ROOT=$(brew --prefix)/var/rbenv
 eval "$(rbenv init -)"
fi

## android
export ANDROID_HOME=/Users/401174/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

## bash-it
export BASH_IT="/Users/401174/.bash_it"
export BASH_IT_THEME='sexy'
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
source "$BASH_IT"/bash_it.sh
