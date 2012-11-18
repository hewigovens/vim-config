#following for more information: http://www.infinitered.com/blog/?p=19

# Colors ----------------------------------------------------------
export TERM=xterm-color

export GREP_OPTIONS='--color=auto' GREP_COLOR='1;32'

export CLICOLOR=1 

#alias ls='ls -G'  # OS-X SPECIFIC - the -G command in OS-X is for colors, in Linux it's no groups
alias ls='ls --color=auto' # For linux, etc

# ls colors, see: http://www.linux-sxs.org/housekeeping/lscolors.html
#export LS_COLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rb=90'  #LS_COLORS is not supported by the default ls command in OS-X
#export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd" #LSCOLORS use in UNIX like system

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



# Prompts ----------------------------------------------------------
# export PS1="\h:\W \u\$" #Default
#export PS1="\[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with only a path
# export PS1="\[${COLOR_GRAY}\]\u@\h \[${COLOR_GREEN}\]\w > \[${COLOR_NC}\]"  # Primary prompt with user, host, and path 
export PS1="\[${COLOR_GREEN}\]\u@\h\[${COLOR_BLUE}\] \w\\n\$\[${COLOR_NC}\] "

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

# I got the following from, and mod'd it: http://www.macosxhints.com/article.php?story=20020716005123797
#    The following aliases (save & show) are for saving frequently used directories
#    You can save a directory using an abbreviation of your choosing. Eg. save ms
#    You can subsequently move to one of the saved directories by using cd with
#    the abbreviation you chose. Eg. cd ms  (Note that no '$' is necessary.)
if [ ! -f ~/.dirs ]; then  # if doesn't exist, create it
	touch ~/.dirs
fi

alias show='cat ~/.dirs'
save (){
	command sed "/!$/d" ~/.dirs > ~/.dirs1; \mv ~/.dirs1 ~/.dirs; echo "$@"=\"`pwd`\" >> ~/.dirs; source ~/.dirs ; 
}
source ~/.dirs  # Initialization for the above 'save' facility: source the .sdirs file
shopt -s cdable_vars # set the bash option so that no '$' is required when using the above facility



# Other aliases ----------------------------------------------------
alias l='ls -ahl'
alias ll='ls -alhO@'
alias la='ls -a'
alias lla='ls -lah'

# Misc
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
#export EDITOR='mate -w'  # OS-X SPECIFIC - TextMate, w is to wait for TextMate window to close
#export EDITOR='gedit'  #Linux/gnome
export EDITOR='vim'  #Command line



# Subversion & Diff ------------------------------------------------
export SV_USER='juser'  # Change this to your username that you normally use on subversion (only if it is different from your logged in name)
export SVN_EDITOR='${EDITOR}'

alias svshowcommands="echo -e '${COLOR_BROWN}Available commands: 
   ${COLOR_GREEN}sv
   ${COLOR_GREEN}sv${COLOR_NC}help
   ${COLOR_GREEN}sv${COLOR_NC}import    ${COLOR_GRAY}Example: import ~/projects/my_local_folder http://svn.foo.com/bar
   ${COLOR_GREEN}sv${COLOR_NC}checkout  ${COLOR_GRAY}Example: svcheckout http://svn.foo.com/bar
   ${COLOR_GREEN}sv${COLOR_NC}status    
   ${COLOR_GREEN}sv${COLOR_NC}status${COLOR_GREEN}on${COLOR_NC}server
   ${COLOR_GREEN}sv${COLOR_NC}add       ${COLOR_GRAY}Example: svadd your_file
   ${COLOR_GREEN}sv${COLOR_NC}add${COLOR_GREEN}all${COLOR_NC}    ${COLOR_GRAY}Note: adds all files not in repository [recursively]
   ${COLOR_GREEN}sv${COLOR_NC}delete    ${COLOR_GRAY}Example: svdelete your_file
   ${COLOR_GREEN}sv${COLOR_NC}diff      ${COLOR_GRAY}Example: svdiff your_file
   ${COLOR_GREEN}sv${COLOR_NC}commit    ${COLOR_GRAY}Example: svcommit
   ${COLOR_GREEN}sv${COLOR_NC}update    ${COLOR_GRAY}Example: svupdate
   ${COLOR_GREEN}sv${COLOR_NC}get${COLOR_GREEN}info${COLOR_NC}   ${COLOR_GRAY}Example: svgetinfo your_file
   ${COLOR_GREEN}sv${COLOR_NC}blame     ${COLOR_GRAY}Example: svblame your_file
'"
   
alias sv='svn --username ${SV_USER}'
alias svimport='sv import'
alias svcheckout='sv checkout'
alias svstatus='sv status'
alias svupdate='sv update'
alias svstatusonserver='sv status --show-updates' # Show status here and on the server
alias svcommit='sv commit'
alias svadd='svn add'
alias svaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
alias svdelete='sv delete'
alias svhelp='svn help' 
alias svblame='sv blame'

svgetinfo (){
 	sv info $@
	sv log $@
}

# You need to create fmdiff and fmresolve, which can be found at: http://ssel.vub.ac.be/ssel/internal:fmdiff
alias svdiff='sv diff --diff-cmd fmdiff' # OS-X SPECIFIC
# Use diff for command line diff, use fmdiff for gui diff, and svdiff for subversion diff

source ~/.vim/.git-completion.bash
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
