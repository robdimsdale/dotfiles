#!/usr/bin/env bash

reset_color="\[\e[39m\]"
green="\[\e[0;32m\]"
bold_cyan="\[\e[36;1m\]"

function clock_prompt {
  echo -e "${bold_cyan}$(date +"%Y-%m-%d %H:%M:%S")"
}

export EDITOR=vim

# Golang
export GOPATH="${HOME}/go"
export PATH=${GOPATH}/bin:${PATH}

gorootbin="/usr/local/go/bin"

if [[ ${PATH} != *"${gorootbin}"* ]]; then
  export PATH=$PATH:"${gorootbin}"
fi

# Rust
if hash rustc 2>/dev/null; then
  export PATH=${HOME}/.cargo/bin:${PATH}

  RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
  export RUST_SRC_PATH

  if hash racer 2>/dev/null; then
    RACER_PATH="$(command -v racer)"
    export RACER_PATH
  fi
fi

if [[ -f /usr/local/bin/direnv  || -f /usr/bin/direnv ]]; then
  eval "$(direnv hook bash)"
fi

export GIT_DUET_ROTATE_AUTHOR=1

# From: http://stackoverflow.com/questions/9457233/unlimited-bash-history/19533853#19533853

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

yubishell() {
  (
    eval $(keychain --agents "gpg" --quiet --eval);
    gpg-connect-agent updatestartuptty /bye;
    export SSH_AUTH_SOCK="$HOME/.gnupg/S.gpg-agent.ssh"
    export PS1='\[\e[31m\][YUBI]\[\e[0m\] \$ ';
    bash --norc
  )
}

source /usr/local/share/chruby/chruby.sh

PS1="\n$(clock_prompt) ${green}\w →${reset_color} "
export PS1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rdimsdale/google-cloud-sdk/path.bash.inc' ]; then . '/Users/rdimsdale/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rdimsdale/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/rdimsdale/google-cloud-sdk/completion.bash.inc'; fi
