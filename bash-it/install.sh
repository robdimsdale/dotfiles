#!/bin/bash
#
# Bash it
#
# This install Bash-it, the community bash framework.

set -eu

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

bashit_dir="$HOME/.bash_it"

aliases_file="${MY_DIR}/aliases"
completions_file="${MY_DIR}/completions"
plugins_file="${MY_DIR}/plugins"

if [[ ! -e ~/.bash_it ]]; then
  echo "  Cloning Bash it."
  git clone https://github.com/Bash-it/bash-it.git "${bashit_dir}"
else 
  echo "  Updating Bash it."
  pushd "${bashit_dir}"
    git pull
  popd
fi

echo "  Installing Bash it."
yes | "${bashit_dir}"/install.sh --none

set +u

set +e
source "${bashit_dir}"/bash_it.sh
set -e

while read completion; do
    [[ -z "${completion}" ]] && continue

    echo "  Installing ${completion}."
    bash-it enable completion "${completion}"
done < "${completions_file}"

while read alias; do
    [[ -z "${alias}" ]] && continue

    echo "  Installing ${alias}."
    bash-it enable alias "${alias}"
done < "${aliases_file}"

while read plugin; do
    [[ -z "${plugin}" ]] && continue

    echo "  Installing ${plugin}."
    bash-it enable plugin "${plugin}"
done < "${plugins_file}"

echo "  Installing custom bash aliases etc."
rm -rf "$HOME/.bash_aliases"
ln -s "${MY_DIR}/.bash_aliases" "$HOME/.bash_aliases"
echo -e "\n# Load custom aliases\n[[ -r $HOME/.bash_aliases ]] && source $HOME/.bash_aliases" >> "$HOME/.bash_profile"

echo "  Sourcing profile."
source "$HOME"/.bash_profile
