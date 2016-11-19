#!/usr/local/env bash

set -eu

gorootbin="/usr/local/go/bin"

if [[ $PATH != *"$gorootbin"* ]]; then
  export PATH=$PATH:$gorootbin
fi

set +eu
