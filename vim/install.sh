#!/bin/bash
#
# Vim
#
# This install Vim using luan's vimfiles. https://github.com/luan/vimfiles

set -eu

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

vim_dir="$HOME/.vim"

aliases_file="${MY_DIR}/aliases"
completions_file="${MY_DIR}/completions"
plugins_file="${MY_DIR}/plugins"

if [[ ! -e "${vim_dir}" ]]; then
  echo "  Cloning Vimfiles."
  git clone https://github.com/luan/vimfiles.git "${vim_dir}"
else
  echo "  Updating Vimfiles."
  pushd "${vim_dir}"
    git pull
  popd
fi

echo "  Installing Vimfiles."
"${vim_dir}"/install

echo "  Installing custom vim configuration."
rm -rf "$HOME/.vimrc.local"
ln -s "${MY_DIR}/.vimrc.local" "$HOME/.vimrc.local"
