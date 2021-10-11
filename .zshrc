# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="spaceship"
if [[ -f ~/.oh-my-zsh/themes/ys-kolo.zsh-theme ]]; then
    ZSH_THEME="ys-kolo"
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(git docker)

source $ZSH/oh-my-zsh.sh

# custom alias
if [[ -f ~/.vim/.alias ]]; then
    source ~/.vim/.alias
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R'

export GOPATH=~/workspace/go
export ANDROID_SDK_ROOT=~/Library/Android/sdk
export ANDROID_HOME=~/Library/Android/sdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=/usr/local/sbin:/usr/local/bin:~/.local/bin:~/.rbenv/bin:$HOME/.cargo/bin:$PATH:$JAVA_HOME/bin:$ANDROID_HOME/tools/bin
export PATH=$GOPATH/bin:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=~/workspace/flutter/bin:$PATH
#export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
export REACT_EDITOR=code
export EDITOR=vim
export NDK_CCACHE=/usr/local/bin/ccache

eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
ssh-add -K

export RELEASE_STORE_FILE=~
export ANDROID_PUBLISHER_CREDENTIALS={}
