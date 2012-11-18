#!/bin/sh

if [ ! -f /etc/shells ];then
    echo "/bin/sh" >> /etc/shells
    echo "/bin/bash" >> /etc/shells
fi

if [ ! -f ~/.bash_profile ];then
    echo "source ~/.bashrc" >> ~/.bash_profile
fi

if [ -n `which sed` ];then
    sed -i '.bak' 's/root:\/bin\/sh/root:\/bin\/bash/g' /etc/master.passwd
    sed -i '.bak' 's/mobile:\/bin\/sh/mobile:\/bin\/bash/g' /etc/master.passwd
fi

ln -s ~/.vim/.bashrc ~/.bashrc
ln -s ~/.vim/.bash_profile ~/.bash_profile
ln -s ~/.vim/.vimrc ~/.vimrc
ln -s ~/.vim/.gitconfig ~/.gitconfig
