set -x TERM "xterm-256color"
set -x VISUAL vim
set -x EDITOR vim
set -x RLWRAP_EDITOR "vim '+call cursor(%L, %C)'"
bind \cx\ce edit_command_buffer
bind \cg  accept-autosuggestion execute

set PATH /Users/brian/smlnj/bin $PATH
set PATH /Users/brian/.cargo/bin $PATH

set -ax MANPATH /opt/local/share/man
set MANPATH /usr/local/opt/erlang/lib/erlang/man $MANPATH

set -x pure_symbol_prompt λ

gabbr -a ... ../../
gabbr -a .... ../../../
gabbr -a ..... ../../../../

abbr gc git commit
abbr ga git add
abbr gl git pull
abbr glg git log
abbr gp git push
abbr gch git checkout

abbr ts tig status
abbr tlg tig log

alias jd="cd ~/config/dotfiles"
alias jv="cd ~/config/dotfiles/.vim"

set -x SMLNJ_HOME "/Users/brian/smlnj"
set -x RBENV_ROOT "/usr/local/var/rbenv"
alias vim="mvim -v"
alias latexpv="latexmk -pdf -pvc -quiet"
alias new="open -n /Applications/Alacritty.app"
alias smlnj="rlwrap -M .sml -m \n sml"
alias ctags="/usr/local/bin/ctags"
alias python="python3"

# opam configuration
source /Users/brian/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
