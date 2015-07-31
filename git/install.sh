#!/bin/bash
#
# Configures git.

set -eu

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "  Installing global git config."
rm -rf "$HOME/.gitconfig"
cp "${MY_DIR}/.gitconfig.example" "$HOME/.gitconfig"

echo "  Installing git authors."
rm -rf "$HOME/.git-authors"
ln -s "${MY_DIR}/.git-authors" "$HOME/.git-authors"
