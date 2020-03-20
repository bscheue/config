source ~/config/scripts/git-prompt.sh
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="verbose git"
GIT_PS1_SHOWDIRTYSTATE=1

# set prompt
export PS1='\n\[\033[34m\]\w\[\033[0m\] $(__git_ps1 "[%s]")\n\[\033[1;31m\]\[\033[00;35m\]λ\[\033[0m\] '
PROMPT_COMMAND='history -a; '${PROMPT_COMMAND}

# make tab cycle through commands after listing
bind '"\t":menu-complete'
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"

# enable **
shopt -s globstar
shopt -s cdspell
shopt -s extglob
shopt -s dotglob
shopt -s histappend

# history
unset HISTFILESIZE
HISTCONTROL=ignoreboth:erasedups
HISTIGNORE='ls:mkdir:rm:fg:history:exit'
HISTSIZE=-1

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
