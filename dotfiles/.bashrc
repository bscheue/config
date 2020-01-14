# update prompt
PS1='\n\[\033[00;34m\]\w\n\[\033[00;35m\]λ\[\033[00m\] '

# make tab cycle through commands after listing
bind '"\t":menu-complete'
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"

# enable **
shopt -s globstar

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
