#!/usr/local/env bash

set -eu

# Overwrite the ruby prompt to remove it without editing the built-in themes.
function ruby_version_prompt() {
  echo -e "\b" # echo backspace to avoid double whitespace.
}

export THEME_SHOW_CLOCK_CHAR=false

set +eu
