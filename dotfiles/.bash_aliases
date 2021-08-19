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
alias gpl="gp --force-with-lease "
__git_complete gch _git_checkout
alias gch="git checkout "
alias gchb="git checkout -b "
alias gst="git status "
alias gr='git reset '
alias gcr="git commit --amend --no-edit"
alias gca="git commit --amend"
alias gbr="git branch --sort=-committerdate"
alias grho='git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'

alias tns="tmux new-session -s "
alias tas="tmux attach-session -t "

alias kdiff="kitty +kitten diff "

function mkcd() {
  mkdir -p "$*"
  cd "$*"
}
