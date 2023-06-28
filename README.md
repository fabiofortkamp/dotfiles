# dotfiles

This is a primitive atempt to sync my dotfiles. Everything is manual
at this point.

This README assumes Ubuntu.

## Installation

### Pre-requisites

1. Install zsh with `sudo apt install zsh`
2. Install [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh);
3. Clone this repository with 
`git clone --recursive https://github.com/fabiofortkamp/dotfiles ~/dotfiles`. 
Currently, this repo must be cloned at the home directory;
4. Remove the file generated by oh-my-zsh (it will be replaced) with `rm ~/.zshrc`;

### Add-ons

1. Install [rustup](https://www.rust-lang.org/tools/install);
2. Install [bat](https://github.com/sharkdp/bat) and [exa](https://github.com/ogham/exa);
3. Install [asdf](https://asdf-vm.com/);
4. Install [VS Code Insiders](https://code.visualstudio.com/insiders/);
5. Install [juliaup](https://github.com/JuliaLang/juliaup);
6. Install neovim 0.9.0 with asdf;
7. Install [LunarVim](https://www.lunarvim.org/docs/installation);

### Final touches

1. Create symlinks: 

- `ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"`;
- `mkdir -p "$HOME/.config" && ln -s "$HOME/dotfiles/config/lvim" "$HOME/.config/lvim"`;
- `ln -s "$HOME/dotfiles/config/nvim"  $HOME/.config/nvim`
- `mkdir -p "$HOME/.julia" && ln -s "$HOME/dotfiles/julia/config" "$HOME/.julia/config"`
- `ln -s $HOME/dotfiles/spacemacs $HOME/.spacemacs`

2. Configure julia in LunarVim according to [this guide](https://www.lunarvim.org/docs/features/supported-languages/julia).

## Features

### LunarVim

LunarVim is set as the default editor - unless in a SSH session, which uses regular `vim`.

### prm

This repo includes 
[my fork of the prm project](https://github.com/fabiofortkamp/prm).

### `custom` folder and the `local` script

The scripts in the `custom` folder are executed in alphabetical order; 
the `custom/local.zsh` is also loaded but it is ignored by git. This is a good
place to put local configurations that you don't want to share with the
world.
