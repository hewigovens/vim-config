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

exit 0
