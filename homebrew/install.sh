#!/bin/bash
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

set -eu

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

packages_file="${MY_DIR}/packages"
taps_file="${MY_DIR}/taps"
binaries_file="${MY_DIR}/cask_binaries"

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "  Updating homebrew."
brew update

echo "  Installing brew cask."
brew install caskroom/cask/brew-cask

while read tap; do
    [[ -z "${tap}" ]] && continue

    echo "  Installing ${tap}."
    # Returns a warning (not error) if package already exists
    brew tap "${tap}"
done < "${taps_file}"

while read pkg; do
    [[ -z "${pkg}" ]] && continue

    echo "  Installing $pkg."
    # Returns a warning (not error) if package already exists
    brew install $pkg || brew upgrade $pkg
done < "${packages_file}"

while read binary; do
    [[ -z "${binary}" ]] && continue

    echo "  Installing ${binary}."
    # Returns a warning (not error) if package already exists
    brew cask install "${binary}"
done < "${binaries_file}"

echo "  Upgrading packages."
brew upgrade

exit 0
