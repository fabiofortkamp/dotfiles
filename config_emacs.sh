#!/usr/bin/env bash

set -e

# Clone doom emacs
echo "Setting up Doom Emacs..."

# emacs-plus commes from https://github.com/d12frosted/homebrew-emacs-plus?tab=readme-ov-file#options
echo "Updating Homebrew..."
brew update
brew upgrade
echo "Installing emacs-plus"
brew tap d12frosted/emacs-plus
brew install emacs-plus

echo "Cloning Doom Emacs repository..."
rm -rf ~/.emacs.d
rm -rf ~/.config/emacs
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs

echo "Installing Doom Emacs..."
~/.config/emacs/bin/doom install
