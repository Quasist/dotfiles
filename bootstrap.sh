#!/bin/bash
############################
# bootstrapper.sh
############################

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/init.vim ~/.config/nvim/init.vim

# tmux
ln -s ${BASEDIR}/tmux.conf ~/.tmux.conf

# bash
ln -s ${BASEDIR}/bashrc ~/.bashrc

# git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
