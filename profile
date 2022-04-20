# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# add Go location to $PATH
export PATH=$PATH:/usr/local/go/bin

# add Go bin path to PATH
export PATH=$PATH:~/go/bin

# set Vim config variables
export VIMCONFIG=$HOME/.vim

# enable fzf
export PATH=$PATH:$VIMCONFIG/pack/bundle/start/fzf/bin

# add scripts directory to PATH
export PATH=$PATH:$HOME/scripts

# Add rbenv to PATH
export PATH=$PATH:~/.rbenv/bin

# Add ~/Software to PATH
export PATH=$PATH:~/Software


# Load .bashrc if it isn't set for login shells
# if running bash
#if [ -n "$BASH_VERSION" ]; then
#    # include .bashrc if it exists
#    if [ -f "$HOME/.bashrc" ]; then
#    . "$HOME/.bashrc"
#    fi
#fi

if [ -n "$BASH_VERSION" -a -n "$PS1" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

# ANSIBLE VAULT DEFAULT PASSWORD FILE
export ANSIBLE_VAULT_PASSWORD_FILE=~/Work/vaultpw.txt

## Rootless Docker setup
#export PATH=/usr/bin:$PATH
#export DOCKER_HOST=unix:///run/user/1000/docker.sock

# set default editor to nvim
export EDITOR=nvim
export VISUAL=nvim

export PATH="$HOME/.poetry/bin:$PATH"
