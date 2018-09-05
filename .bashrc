# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
# bash powerline 
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# python virtual env 
source ~/.autoenv/activate.sh

# bash aliases 

if [ -f .bash_aliases ]; then 
	. .bash_aliases
fi

# bash functions
if [ -f .bash_functions ]; then 
	. .bash_functions
fi
