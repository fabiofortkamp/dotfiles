#!/usr/bin/env bash

# Install curl from source if not available

DOTFILES="$HOME/dotfiles"
mkdir -p "$HOME/.local/{bin,lib}"
mkdir -p "$HOME/build"

source "$DOTFILES/install_curl.sh"
# # Install rustup
# curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
#
# # Install juliaup
# curl -fsSL https://install.julialang.org | sh
#
# # Install GHCup
# curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
#
# ./brew.sh
# ./brew-config.sh
# ./install-asdf.zsh
