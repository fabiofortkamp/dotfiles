#!/usr/bin/env bash

# Install curl from source if not available
set -e          # Exit immediately if a command exits with non-zero status
set -u          # Treat unset variables as an error
set -o pipefail # Return value of a pipeline is the status of the last command that failed

DOTFILES="$HOME/dotfiles"

# important directories that will be use by the installation tools
mkdir -p "$HOME/.local/{bin,lib}"
mkdir -p "$HOME/build"

# Install homebrew
source "$DOTFILES/brew.sh"

# Install neovim from source
source "$DOTFILES/build_neovim.sh"

# Link everything together
source "$DOTFILES/stow.sh"

# Install tools with mise
mise install

# Additional symbolic links
ln -s "$HOME/dotfiles/default-gems" "$HOME/.default-gems"
