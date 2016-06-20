autoload -U colors && colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn

theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats '%F{white}on %B%F{cyan}git:[%b%c%u%B%F{cyan}]'
    } else {
        zstyle ':vcs_info:*' formats '%F{white}on %B%F{cyan}git:[%b%c%u%B%F{red}●%B%F{cyan}]'
    }
    current_dir="${PWD/#$HOME/~}"
    vcs_info
}

function ip_address(){
    # ethernet
    IPADDR0=`ifconfig en0 2>/dev/null | grep -v inet6 | grep inet | awk '{print $2}'`
    # wifi
    IPADDR1=`ifconfig en1 2>/dev/null | grep -v inet6 | grep inet | awk '{print $2}'`
    # thunderbolt
    IPADDR2=`ifconfig en4 2>/dev/null | grep -v inet6 | grep inet | awk '{print $2}'`

    # display ip address on prompt
    if [[ ! -z $IPADDR0 ]]; then
        echo $IPADDR0
    elif [[ ! -z $IPADDR1 ]]; then
        echo $IPADDR1
    elif [[ ! -z $IPADDR2 ]]; then
        echo $IPADDR2
    else
        echo `hostname`
    fi
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%B%F{red}(ssh) "
  fi
}

setopt prompt_subst
PROMPT='%B%F{blue}# ⌚  %B%F{red}%*%{$reset_color%} $(ssh_connection)%b%F{cyan}%n%F{white}@%b%F{green}$(ip_address)%F{white} in %B%F{yellow}${current_dir}%b%F{cyan} ${vcs_info_msg_0_}%B%F{yellow} 
%B%F{red}% %# %{$reset_color%}'

# RPROMPT='⌚ %B%F{red}%*%{$reset_color%}'

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
