# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME=""

export TERM="xterm-256color"

# the following line toggles case sensitive completion
CASE_SENSITIVE="true"

DISABLE_AUTO_UPDATE="true"

ZSH_START_MARKS=1
ZSH_AUTOSUGGEST_USE_ASYNC=1

plugins=(
  git
  zshmarks
  start
  zsh-autosuggestions
)

alias j="jump"

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

  eval $(gdircolors ~/.dircolors/.nord_dir_colors)
  alias ls='gls --color=auto'
  alias ll='ls -al'

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

bindkey -M menuselect '^[[Z' reverse-menu-complete

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
            echo -ne "\e[0 q"
        else
            # the insert mode for vi
            echo -ne "\e[6 q"
        fi
    fi
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
PURE_PROMPT_VICMD_SYMBOL=Λ
prompt pure

export KEYTIMEOUT=25

# vim keybindings overwrite these, so need to over over write those
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey '^s' autosuggest-accept
bindkey '^ ' autosuggest-execute

