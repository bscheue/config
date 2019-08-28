set -x TERM "xterm-256color"
set -x VISUAL vim
set -x EDITOR vim
bind \cx\ce edit_command_buffer
bind \cs  accept-autosuggestion execute

set PATH /Users/brian/smlnj/bin $PATH
set -ax MANPATH /opt/local/share/man

set -x pure_symbol_prompt λ

gabbr -a ... ../../
gabbr -a .... ../../../
gabbr -a ..... ../../../../

alias jd="cd ~/config/dotfiles"
alias jv="cd ~/config/dotfiles/.vim"
alias jr="cd ~/Documents/jobs/resume"

if test -n "$SSH_CLIENT" || test -n "$SSH_TTY"
  set -x VISUAL vim
else
  set -x SMLNJ_HOME "/Users/brian/smlnj"
  set -x RBENV_ROOT /usr/local/var/rbenv
  alias vim="mvim -v"
  alias latexpv="latexmk -pdf -pvc -quiet"
  alias new="open -n /Applications/Alacritty.app"
  alias smlnj="rlwrap sml"
  alias ctags="/usr/local/bin/ctags"
  alias python="python3"
  # for running github io page locally
  alias gtags="git ls-files | entr ctags --tag-relative -f .git/tags --languages=-javascript (git ls-files)"
end
