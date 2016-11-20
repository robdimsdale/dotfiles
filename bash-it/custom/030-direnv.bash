#!/usr/local/env bash

set -eu

if [[ -f /usr/local/bin/direnv  || -f /usr/bin/direnv ]]; then
  eval "$(direnv hook bash)"
fi

set +eu
