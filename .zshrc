# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"
# ZSH_THEME="powerline"

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
plugins=(git python brew)

source $ZSH/oh-my-zsh.sh

if [[ -f ~/.vim/.alias ]]; then
    source ~/.vim/.alias
fi

IPADDR=`ifconfig en0 2>/dev/null | grep -v inet6 | grep inet | awk '{print $2}'`
if [[ -z $IPADDR ]]; then
    IPADDR=`hostname`
fi

export PROMPT='%{$fg[green]%}%n@$IPADDR$reset_color%} %{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%d %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} 
% %# %{$reset_color%}'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
