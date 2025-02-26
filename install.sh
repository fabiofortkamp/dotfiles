#!/usr/bin/env bash

# Install curl from source if not available

DOTFILES="$HOME/dotfiles"

# important directories that will be use by the installation tools
mkdir -p "$HOME/.local/{bin,lib}"
mkdir -p "$HOME/build"

# Install homebrew
source "$DOTFILES/brew.sh"

# Link everything together
source "$DOTFILES/stow.sh"
