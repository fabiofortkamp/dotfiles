#!/usr/bin/env bash

set -e          # Exit immediately if a command exits with non-zero status
set -u          # Treat unset variables as an error
set -o pipefail # Return value of a pipeline is the status of the last command that failed

cwd=$(pwd)

if [ -d "$HOME/build/neovim" ]; then
  echo "Removing old neovim directory"
  rm -rf "$HOME/build/neovim"
fi

echo "Cloning neovim source"
git clone git@github.com:neovim/neovim.git "$HOME/build/neovim"
cd "$HOME/build/neovim"

echo "Installing neovim from $(pwd)"
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local" CMAKE_BUILD_TYPE=RelWithDebInfo
make install

echo "Returning to $cwd"
cd $cwd
