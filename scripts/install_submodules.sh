#!/bin/bash

cd ~/.vim

echo "init and update submodules..."
git submodule update --init

echo "init and update submodules' submodules..."
git submodule foreach git submodule update --init

echo "install command-t..."
(cd bundle/command-t/ruby/command-t && ruby extconf.rb && make) || echo "command-t installation failed"

echo "install pyflakes..."
(cd bundle/pyflakes/ftplugin/python/pyflakes && sudo python setup.py install) || echo "pyflakes installation failed"

echo "patch pydiction keybindings to <C-J>"
patch -p0 -i ~/.vim/scripts/keybinding.patch

echo "check if need to install oh-my-zsh"
if [ -d ~/.oh-my-zsh ]; then
    curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
fi

exit 0
