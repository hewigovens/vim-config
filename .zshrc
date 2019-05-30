# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="ys"
if [[ -f ~/.oh-my-zsh/themes/ys-kolo.zsh-theme ]]; then
    ZSH_THEME="ys-kolo"
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git python brew ruby node pod docker gem bundle react-native osx thefuck tmux sudo rsync)

source $ZSH/oh-my-zsh.sh

# custom alias
if [[ -f ~/.vim/.alias ]]; then
    source ~/.vim/.alias
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# export PROMPT='%{$fg[green]%}%n@$IPADDR$reset_color%} %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} 
# % %# %{$reset_color%}'
# e.g. hewig@192.168.17.242 ➜  /Users/hewig/.vim/ git:(master)

export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R'

export GOPATH=~/workspace/go
export ANDROID_SDK_ROOT=/usr/local/share/android-sdk
export ANDROID_HOME=/usr/local/share/android-sdk
export PATH=/usr/local/sbin:/usr/local/bin:~/workspace/theos/bin:~/.rbenv/bin:$HOME/.cargo/bin:$PATH
export PATH=~/workspace/geth/bin:$PATH
export PATH=~/workspace/google-cloud-sdk/bin:$PATH
export PATH=$GOPATH/bin:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=~/workspace/flutter/bin:$PATH
export PATH=/usr/local/opt/llvm/bin:$PATH
export DEVELOPER_DIR=/Applications/Xcode.app/Contents/Developer
export REACT_EDITOR=code
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

eval $(thefuck --alias)
eval "$(rbenv init -)"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
. <(npm completion)
ssh-add -K
