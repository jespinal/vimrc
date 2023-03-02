#!/usr/bin/env bash

alias vim="$HOME/bin/tmux-vim"

# Adding timestamp to `history` command entries
export HISTTIMEFORMAT='%F %T '

# Our old friend `fortune` :)
if [ -n $(which fortune) ]; then fortune; fi

# Updating history in realtime
shopt -s histappend

# Setting VISUAL and EDITOR varibles (useful for tmux)
export VISUAL=vim
export EDITOR=vim

# Extending PATH variable
export PATH=$HOME/bin:$HOME/.local/bin:$PATH

# Allowing a HOME-based man path
export MANPATH=$HOME/share/man:$MANPATH
