export TERM="xterm-256color"

# aliases
alias -g ...=../../
alias -g ....=../../../
alias -g .....=../../../../

# zsh doesn't set a history file by default, so set one
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt sharehistory      # share history across terminals
setopt incappendhistory  # immediately append to the history file, not just when a term is killed
setopt appendhistory

fpath+=~/.zsh/functions/zsh_functions

PATH=/bin:/usr/bin:/usr/local/bin:${PATH}
PATH+=:/Users/brian/smlnj/bin
export PATH

export MANPATH=/opt/local/share/man:$MANPATH

source ~/.zsh/plugins/zshmarks/zshmarks.plugin.zsh
  alias j="jump"
ZSH_START_MARKS=1
source ~/.zsh/plugins/zsh-start/start.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_USE_ASYNC=1
source ~/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
  bindkey '^P' history-substring-search-up
  bindkey '^N' history-substring-search-down

# improved tab completion
zmodload -i zsh/complist
# use the same colors for tab completion as used by ls
source ~/.zsh/colors/ls_colors.zsh
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
zstyle ':completion:*:*:*:*:*' menu select
autoload -Uz compinit
compinit
unsetopt menu_complete # do not autoselect the first completion entry
unsetopt flowcontrol
setopt auto_menu # show completion menu on successive tab press
setopt complete_in_word
setopt always_to_end # cursor is moved to end of word after full completion is inserted

# improved history search menu
autoload -Uz history-beginning-search-menu
zle -N history-beginning-search-menu
bindkey '^X^X' history-beginning-search-menu

if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
else
  alias ls='gls --color=auto'

  alias vim='mvim -v'

  alias latexpv='latexmk -pdf -pvc -quiet'
  # prefer exuberant ctags to the tags command that ships with mac
  alias ctags="`brew --prefix`/bin/ctags"

  export SMLNJ_HOME="/Users/brian/smlnj"
  alias smlnj="rlwrap sml"

  alias new="open -n /Applications/Alacritty.app"

  # for running github io page locally
  export RBENV_ROOT=/usr/local/var/rbenv
  eval "$(rbenv init -)"

  function scp1 { scp bscheuer@unix.andrew.cmu.edu:~/private/$1 $2 }
  function scp2 { scp $1 bscheuer@unix.andrew.cmu.edu:~/private/$2 }

  function scp1r { scp -r bscheuer@unix.andrew.cmu.edu:~/private/$1 $2 }
  function scp2r { scp -r $1 bscheuer@unix.andrew.cmu.edu:~/private/$2 }
fi

function cs { builtin cd "$@" && ls }

if type 'python3' > /dev/null ; then
  alias python='python3'
fi

autoload -U promptinit; promptinit
PURE_PROMPT_SYMBOL=λ
prompt pure

autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line

bindkey '^s' autosuggest-accept
bindkey '^ ' autosuggest-execute

# needs to be sourced last
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
