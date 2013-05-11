#!which bash

git clone https://github.com/tpope/vim-pathogen.git ~/.vim/bundle/pathogen

rm -rf ~/.bashrc
rm -rf ~/.vimrc

ln -s ~/.vim/.bashrc ~/.bashrc
ln -s ~/.vim/.vimrc ~/.vimrc

if [ -n `which sed` ];then
    sed -i 's/vim-pathogen/pathogen/g' ~/.vim/.vimrc
fi