#!/usr/bin/env bash

set -eu

export GOPATH="${HOME}/go"
export PATH=${GOPATH}/bin:${PATH}

gorootbin="/usr/local/go/bin"

if [[ ${PATH} != *"${gorootbin}"* ]]; then
  export PATH=$PATH:"${gorootbin}"
fi

set +eu
