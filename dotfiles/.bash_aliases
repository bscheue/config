alias cddot="cd ~/config/dotfiles"
alias cdvim="cd ~/config/dotfiles/.vim"

PAR=~/Documents/S20/15418
HOT=~/Documents/S20/15417
LIN=~/Documents/S20/21341
TA=~/Documents/ta15150

alias vim="mvim -v"
alias latexpv="latexmk -pdf -pvc -quiet"
alias smlnj="rlwrap -M .sml -m \\\\n sml"
alias ctags="/usr/local/bin/ctags"
alias python="python3"

alias gc="git commit "
alias gcm="git commit -m \""
alias ga="git add "
alias gl="git pull "
alias glg="git log "
alias gp="git push "
alias gch="git checkout "
alias gchb="git checkout -b "
alias gst="git status "

alias tst="tig status "
alias tlg="tig log "

alias tns="tmux new-session -s "
alias tas="tmux attach-session -t "

function cd() {
  if [ "$#" = "0" ]
  then
  pushd ${HOME} > /dev/null
  elif [ -f "${1}" ]
  then
    ${EDITOR} ${1}
  else
  pushd "$1" > /dev/null
  fi
}

function bd() {
  if [ "$#" = "0" ]
  then
    popd > /dev/null
  else
    for i in $(seq ${1})
    do
      popd > /dev/null
    done
  fi
}

mkcd() {
	mkdir -p "$*"
	cd "$*"
}

function gpoc() {
  git push origin $(git rev-parse --abbrev-ref HEAD)
}

function cdhot() {
  cd $HOT/$(ls $HOT | grep "^p." | tail -n1)
}

function cdlin() {
  cd $LIN/$(ls $LIN | grep "^hw.." | tail -n1)
}

function findd() {
  SEARCH="$1"
  DIRS="${@:2}"
  find ${DIRS:-.} -name "$SEARCH"
}

function grepd() {
  SEARCH="$1"
  DIRS="${@:2}"
  grep -s -r "$SEARCH" ${DIRS:-.}
}
