set -x TERM "xterm-256color"

set -x VISUAL vim
set -x EDITOR vim
bind \cx\ce edit_command_buffer

set -x pure_symbol_prompt λ


gabbr -a ... ../../
gabbr -a .... ../../../
gabbr -a ..... ../../../../

if test -n "$SSH_CLIENT" || test -n "$SSH_TTY"
  set -x VISUAL vim
else
  alias vim="mvim -v"
  alias latexpv="latexmk -pdf -pvc -quiet"
  alias new="open -n /Applications/Alacritty.app"
  alias smlnj="rlwrap sml"
  set -x SMLNJ_HOME "/Users/brian/smlnj"
  alias ctags="/usr/local/bin/ctags"
  # for running github io page locally
  set -x RBENV_ROOT /usr/local/var/rbenv
end
