\0;95;0c# my bash stuff!

# emacs
alias e=emacs

## term-note
alias tn="$HOME/dev/term-note/tn.sh"

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

## git.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $"

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
else
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
  . ~/.git-completion.bash
fi

## brew
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

## brew packages
### direnv
#### enable direnv hook for .envrc files
eval "$(direnv hook bash)"

## golang
export GOPATH=$HOME/dev/go
export PATH=$GOPATH/bin:/usr/local/Cellar/go/1.8.3/bin:$PATH

## node version manager
export NVM_DIR="$HOME/.nvm"
source "$(brew --prefix nvm)/nvm.sh"

## ruby environment manager
if [ -f $(brew --prefix)/bin/rbenv ]; then
 export RBENV_ROOT=$(brew --prefix)/var/rbenv
 eval "$(rbenv init -)"
fi

## android
export ANDROID_HOME=/Users/austinwitherow/Library/Android/sdk
export PATH=$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

## iterm
export TERM=xterm-256color

## bash-it
export BASH_IT="$HOME/.bash_it"
export BASH_IT_THEME='sexy'
export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1
source "$BASH_IT"/bash_it.sh

# final
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
##
# Your previous /Users/austinwitherow/.bash_profile file was backed up as /Users/austinwitherow/.bash_profile.macports-saved_2017-09-10_at_12:23:16
##

# MacPorts Installer addition on 2017-09-10_at_12:23:16: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.


# MacPorts Installer addition on 2017-09-10_at_12:23:16: adding an appropriate MANPATH variable for use with MacPorts.
export MANPATH="/opt/local/share/man:$MANPATH"
# Finished adapting your MANPATH environment variable for use with MacPorts.

# Open new Terminal tabs from the command line
#
# Author: Justin Hileman (http://justinhileman.com)
#
# Installation:
#     Add the following function to your `.bashrc` or `.bash_profile`,
#     or save it somewhere (e.g. `~/.tab.bash`) and source it in `.bashrc`
#
# Usage:
#     tab                   Opens the current directory in a new tab
#     tab [PATH]            Open PATH in a new tab
#     tab [CMD]             Open a new tab and execute CMD
#     tab [PATH] [CMD] ...  You can prob'ly guess

# Only for teh Mac users
[ `uname -s` != "Darwin" ] && return

function tab () {
    local cmd=""
    local cdto="$PWD"
    local args="$@"

    if [ -d "$1" ]; then
        cdto=`cd "$1"; pwd`
        args="${@:2}"
    fi

    if [ -n "$args" ]; then
        cmd="; $args"
    fi

    osascript &>/dev/null <<EOF
        tell application "iTerm"
            tell current terminal
                launch session "Default Session"
                tell the last session
                    write text "cd \"$cdto\"$cmd"
                end tell
            end tell
        end tell
EOF
}
