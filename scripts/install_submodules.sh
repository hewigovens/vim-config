#!/bin/bash

cd ~/.vim

echo "init and update submodules..."
git submodule update --init

echo "init and update submodules' submodules..."
git submodule foreach git submodule update --init

echo "install command-t..."
(cd bundle/command-t/ruby/command-t && ruby extconf.rb && make) || echo "command-t installation failed"

echo "check if need to install oh-my-zsh"
if [ ! -d ~/.oh-my-zsh ]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

echo "check if need to install homebrew"
if [ ! -f /usr/local/bin/brew ]; then
    if [[ "`uname|tr '[A-Z]' '[a-z]'`" == "darwin" ]]; then
        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
fi

exit 0
