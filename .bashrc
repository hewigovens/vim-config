#From: http://www.infinitered.com/blog/?p=19

# Colors ----------------------------------------------------------
export TERM=xterm-color
export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'
export CLICOLOR=1 

OS_NAME=`uname`
if [[ "$OS_NAME" == "Darwin" ]]; then
    alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
else 
    alias ls='ls --color=auto' # For linux, etc
fi

# ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
# Setup some colors to use later in interactive shell or scripts
export COLOR_NC='\033[0m' # No Color
export COLOR_WHITE='\033[1;37m'
export COLOR_BLACK='\033[0;30m'
export COLOR_BLUE='\033[0;34m'
export COLOR_LIGHT_BLUE='\033[1;34m'
export COLOR_GREEN='\033[0;32m'
export COLOR_LIGHT_GREEN='\033[1;32m'
export COLOR_CYAN='\033[0;36m'
export COLOR_LIGHT_CYAN='\033[1;36m'
export COLOR_RED='\033[0;31m'
export COLOR_LIGHT_RED='\033[1;31m'
export COLOR_PURPLE='\033[0;35m'
export COLOR_LIGHT_PURPLE='\033[1;35m'
export COLOR_BROWN='\033[0;33m'
export COLOR_YELLOW='\033[1;33m'
export COLOR_GRAY='\033[1;30m'
export COLOR_LIGHT_GRAY='\033[0;37m'
alias colorslist="set | egrep 'COLOR_\w*'"  # Lists all the colors, uses vars in .bashrc_non-interactive

# Misc -------------------------------------------------------------
export HISTCONTROL=ignoredups
shopt -s checkwinsize # After each command, checks the windows size and changes lines and columns

# bash completion settings (actually, these are readline settings)
bind "set completion-ignore-case on" # note: bind used instead of sticking these in .inputrc
bind "set bell-style none" # no bell
bind "set show-all-if-ambiguous On" # show list automatically, without double tab

# Turn on advanced bash completion if the file exists (get it here: http://www.caliban.org/bash/index.shtml#completion)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# git completion settings
if [[ -f ~/.vim/.git-completion.bash ]]; then
  source ~/.vim/.git-completion.bash
fi

if [[ -f ~/.vim/.git-prompt.bash ]]; then
  source ~/.vim/.git-prompt.bash
fi

# Prompts ----------------------------------------------------------
if [[ "$OS_NAME" == "Linux" ]]; then
  IP_ADDR=`ifconfig wlan0 2>/dev/null | grep -v inet6 | grep inet | awk '{print $2}' | cut -d":" -f2`
elif [[ "$OS_NAME" == "Darwin" ]]; then
  IP_ADDR=`ifconfig en0 2>/dev/null | grep -v inet6 | grep inet | awk '{print $2}'`
fi

if [[ -z $IP_ADDR ]]; then
  IP_ADDR=`hostname`
fi

export PS1="\[${COLOR_GREEN}\]${USER}@${IP_ADDR}\[${COLOR_BLUE}\] \w\$(__git_ps1)\n\$\[${COLOR_NC}\] "

# This runs before the prompt and sets the title of the xterm* window.  If you set the title in the prompt
# weird wrapping errors occur on some systems, so this method is superior
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*} ${PWD}"; echo -ne "\007"'  # user@host path

#export PS2='> '    # Secondary prompt
#export PS3='#? '   # Prompt 3
#export PS4='+'     # Prompt 4

function xtitle {  # change the title of your xterm* window
  unset PROMPT_COMMAND
  echo -ne "\033]0;$1\007" 
}

# Navigation -------------------------------------------------------
alias ..='cd ..'
alias ...='cd .. ; cd ..'

# Misc
alias l='ls -ahl'
alias ll='ls -alhO@'
alias la='ls -a'
alias lla='ls -lah'
alias g='grep -ni'  # Case insensitive grep
alias f='find . -iname'
alias ducks='du -cksh * | sort -rn|head -11' # Lists folders and files sizes in the current folder
alias top='top -o cpu'
alias systail='tail -f /var/log/system.log'
alias m='more'
alias df='df -h'

# Shows most used commands, cool script I got this from: http://lifehacker.com/software/how-to/turbocharge-your-terminal-274317.php
alias profileme="history | awk '{print \$2}' | awk 'BEGIN{FS=\"|\"}{print \$1}' | sort | uniq -c | sort -n | tail -n 20 | sort -nr"

# Editors ----------------------------------------------------------
export EDITOR='vim'  #Command line

# git complete settings
if [[ -f ~/.vim/.git-completion.bash ]]; then
  source ~/.vim/.git-completion.bash
fi

if [[ -f ~/.vim/.git-prompt.bash ]]; then
  source ~/.vim/.git-prompt.bash
fi

export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
