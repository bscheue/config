# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="refined"

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_USE_ASYNC=1

export TERM="xterm-256color"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
export PATH

export PATH="$PATH:$HOME/.vim/bundle/vim-superman/bin"
compdef vman="man" # get tab completion
export PATH="$PATH:/Users/brian/Documents/lean-3.4.2/bin"

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
else
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  alias vim="mvim -v"
  export PATH="$PATH:/Users/brian/smlnj/bin"
  export SMLNJ_HOME="/Users/brian/smlnj"
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
export KEYTIMEOUT=10

# vim keybindings overwrite these, so need to over over write those
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

bindkey '^s' autosuggest-accept
bindkey '^ ' autosuggest-execute

