# dotfiles

This is a primitive atempt to sync my dotfiles. Everything is manual
at this point.

## Installation

1. Install zsh and set it as your default shell
2. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)
4. Clone this repository with 
`git clone --recursive https://github.com/fabiofortkamp/dotfiles ~/`. 
Currently, this repo must be cloned at the home directory.
5. Create a symlink: `ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc`

## Features

### prm

This repo includes 
[my fork of the prm project](https://github.com/fabiofortkamp/prm).

### VS Code

This repo has some VS Code workspace-specific settings that I like to use for
this particular project:

- Theme: Atom Dark One