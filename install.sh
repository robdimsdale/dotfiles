#!/usr/bin/env bash
#
# Run all dotfiles installers.

set -eu

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"${MY_DIR}/homebrew/install.sh"
"${MY_DIR}/git/install.sh"
"${MY_DIR}/bash-it/install.sh"
"${MY_DIR}/vim/install.sh"
"${MY_DIR}/osx/install.sh"
