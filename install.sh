#!/usr/bin/env bash

backup() {
    target=$1
    if [[ -e "$target" ]];then
        if [[ ! -L "$target" ]];then
            mv "$target" "$target.backup"
            echo "=== Moved your old $target config file to $target.backup"
        fi
    fi
}

symlink() {
    file=$1
    link=$2
    if [[ ! -e "$link" ]];then
        echo "=== Symlinking your new $link"
        ln -s $file $link
    fi
}

# global variables
thispath=$(cd $(dirname $0);pwd)

# global settings
target=$HOME/.alias_functions
backup $target
symlink $thispath/alias_functions $target

# install vim plugins

# install zsh plugins

# bash settings
target=$HOME/.bashrc
backup $target
symlink $thispath/bash/bashrc $target

# git settings
target=$HOME/.gitconfig
backup $target
symlink $thispath/git/gitconfig $target

# tmux settings
target=$HOME/.tmux.conf
backup $target
symlink $thispath/tmux/tmux.conf $target

# vim settings
target=$HOME/.vimrc
backup $target
symlink $thispath/vim/vimrc $target

# vscode settings

# zsh settings
target=$HOME/.zshrc
backup $target
symlink $thispath/zsh/zshrc $target

# SSH settings
target=$HOME/.ssh/config
backup $target
symlink $thispath/ssh/config $target

echo "=== Please reenter the shell to refresh all config flies"
