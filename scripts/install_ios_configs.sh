#!/bin/sh

if [ ! -f /etc/shells ];then
    echo "/bin/sh" >> /etc/shells
    echo "/bin/bash" >> /etc/shells
fi

if [ ! -f ~/.bash_profile ];then
    echo "source ~/.bashrc" >> ~/.bash_profile
fi

if [ -n `which sed` ];then
    sed -i 's/root:\/bin\/sh/root:\/bin\/bash/g' /etc/master.passwd
    sed -i 's/mobile:\/bin\/sh/mobile:\/bin\/bash/g' /etc/master.passwd
fi

rm -rf ~/.bashrc
rm -rf ~/.vimrc

ln -s ~/.vim/.bashrc ~/.bashrc
ln -s ~/.vim/.vimrc ~/.vimrc
