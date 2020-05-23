[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source <(kitty + complete setup bash)

export TERM="xterm-256color"
export VISUAL=vim
export EDITOR=vim
export RLWRAP_EDITOR="vim '+call cursor(%L, %C)'"

export RBENV_ROOT="/usr/local/var/rbenv"

export GOPATH=$HOME/gobook

export PATH=/usr/local/smlnj/bin:"$PATH"
export PATH=/Users/brian/.cargo/bin:$PATH

export MANPATH=$MANPATH:opt/local/share/man
export MANPATH=$MANPATH:/usr/local/opt/erlang/lib/erlang/man

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
