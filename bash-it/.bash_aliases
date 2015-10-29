#!/usr/bin/env bash

export GOPATH=${HOME}/go
export PATH=${GOPATH}/bin:${PATH}

# Direnv
if [ -f /usr/local/bin/direnv ]; then
  eval "$(direnv hook bash)"
fi

# git duet
alias duet="git duet --global"
alias solo="git solo --global"
alias dci="git duet-commit"

export EDITOR=vim
