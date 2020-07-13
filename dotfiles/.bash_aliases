alias cddot="cd ~/config/dotfiles"
alias cdvim="cd ~/config/dotfiles/.vim"

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
alias gcr="git commit --amend --no-edit"
alias gca="git commit --amend"

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

function gloc() {
  git pull origin $(git rev-parse --abbrev-ref HEAD)
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

# from: https://gist.github.com/premek/6e70446cfc913d3c929d7cdbfe896fef
# Usage: mv oldfilename
# If you call mv without the second parameter it will prompt you to edit the filename on command line.
# Original mv is called when it's called with more than one argument.
function mv() {
  if [ "$#" -ne 1 ]; then
    command mv "$@"
    return
  fi
  if [ ! -f "$1" ]; then
    command file "$@"
    return
  fi

  read -ei "$1" newfilename
  mv "$1" "$newfilename"
}
