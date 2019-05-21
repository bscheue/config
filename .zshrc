# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="refined"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_USE_ASYNC=1

export TERM="xterm-256color"

# the following line toggles case sensitive completion
CASE_SENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH

export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
compdef vman="man" # get tab completion

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  export PATH="/usr/local/bin:$PATH"
  export MANPATH=/opt/local/share/man:$MANPATH
  export PATH="$PATH:/Users/brian/smlnj/bin"
  export SMLNJ_HOME="/Users/brian/smlnj"

  # for running github io page locally
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"

  function scp1 { scp bscheuer@unix.andrew.cmu.edu:~/private/$1 $2 }
  function scp2 { scp $1 bscheuer@unix.andrew.cmu.edu:~/private/$2 }

  function scp1r { scp -r bscheuer@unix.andrew.cmu.edu:~/private/$1 $2 }
  function scp2r { scp -r $1 bscheuer@unix.andrew.cmu.edu:~/private/$2 }
fi

function cs { builtin cd "$@" && ls }


alias smlnj="rlwrap sml"


bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward
bindkey -M viins 'jj' vi-cmd-mode

function zle-line-init zle-keymap-select {
    if [ "$TERM" = "xterm-256color" ]; then
        if [ $KEYMAP = vicmd ]; then
            # the command mode for vi
            echo -ne "\e[2 q"
        else
            # the insert mode for vi
            echo -ne "\e[5 q"
        fi
    fi
    VIM_PROMPT_NORMAL="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    VIM_PROMPT_INS="%{$fg_bold[green]%} [% INSERT]%  %{$reset_color%}"
    RPS1="${${KEYMAP/vicmd/$VIM_PROMPT_NORMAL}/(main|viins)/$VIM_PROMPT_INS} $EPS1"
    zle reset-prompt
}


zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=25

# vim keybindings overwrite these, so need to over over write those
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey '^s' autosuggest-accept
bindkey '^ ' autosuggest-execute


