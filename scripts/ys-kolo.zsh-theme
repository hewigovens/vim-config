autoload -U colors && colors

autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr '%F{green}●'
zstyle ':vcs_info:*' unstagedstr '%F{yellow}●'
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{11}%r'
zstyle ':vcs_info:*' enable git svn
theme_precmd () {
    if [[ -z $(git ls-files --other --exclude-standard 2> /dev/null) ]] {
        zstyle ':vcs_info:*' formats '[%b%c%u%B%F{cyan}]'
    } else {
        zstyle ':vcs_info:*' formats ' [%b%c%u%B%F{red}●%F{cyan}]'
    }

    vcs_info
}

function ip_address(){
    # ethernet
    IPADDR0=`ifconfig en0 2>/dev/null | grep -v inet6 | grep inet | awk '{print $2}'`
    # wifi
    IPADDR1=`ifconfig en1 2>/dev/null | grep -v inet6 | grep inet | awk '{print $2}'`

    # display ip address on prompt
    if [[ ! -z $IPADDR0 ]]; then
        echo $IPADDR0
    elif [[ ! -z $IPADDR1 ]]; then
        echo $IPADDR1
    else
        echo `hostname`
    fi
}

function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%{$fg_bold[red]%}(ssh) "
  fi
}

setopt prompt_subst
PROMPT='%{$terminfo[bold]$fg[blue]%}# $(ssh_connection)%{$fg[cyan]%}%n%{$fg[white]%} at %{$fg[green]%}$(ip_address)%{$fg[white]%} in %B%F{yellow}%d%B%F{cyan} %{$fg[white]%}on%{$reset_color%} git:%{$fg[cyan]%}${vcs_info_msg_0_}%B%F{yellow} 
%{$terminfo[bold]$fg[red]%}% %# %{$reset_color%}'

RPROMPT='⌚ %{$fg_bold[red]%}%*%{$reset_color%}'
#PROMPT='%B%F{magenta}%c%B%F{green}${vcs_info_msg_0_}%B%F{magenta} %{$reset_color%}%% '

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
