#!/bin/bash

read -p "This script will overwrite .vimrc, .bashrc, .zshrc under home directory. Are you sure?(y/n) " -n 1
if [ "$REPLY" == "n" -o "$REPLY" == "N" ];then
    exit 1
fi

rm -rf ~/.vimrc
rm -rf ~/.bashrc
rm -rf ~/.zshrc
rm -rf ~/.gitconfig
rm -rf ~/.gitignore
rm -rf ~/.gemrc

ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.bashrc ~/.bashrc
ln -s ~/.vim/.zshrc ~/.zshrc
ln -s ~/.vim/.gitconfig ~
ln -s ~/.vim/.gitignore ~
ln -s ~/.vim/.gemrc ~

if [ -d ~/.oh-my-zsh ];then
    mkdir -pv ~/.oh-my-zsh/themes
    cp -rf ~/.vim/scripts/ys-kolo.zsh-theme ~/.oh-my-zsh/themes/ys-kolo.zsh-theme
fi

exit 0
