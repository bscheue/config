alias jd="cd ~/config/dotfiles"
alias jv="cd ~/config/dotfiles/.vim"

alias vim="mvim -v"
alias latexpv="latexmk -pdf -pvc -quiet"
alias smlnj="rlwrap -M .sml -m \n sml"
alias ctags="/usr/local/bin/ctags"
alias python="python3"

alias gc="git commit "
alias ga="git add "
alias gl="git pull "
alias glg="git log "
alias gp="git push "
alias gch="git checkout "
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

function bd(){
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
