# dotfiles

Ubuntu-based configuration for zsh, Neovim, LunarVim and Julia.

## Installation

### Pre-requisites

Install git:

```shell
sudo apt install git
git config --global user.name "<NAME>"
git config --global user.email "<email>"
```

Install [VS Code Insiders](https://code.visualstudio.com/insiders/).

Then, clone this repo:

```shell

git clone --recursive https://github.com/fabiofortkamp/dotfiles ~/dotfiles 
```

### Bootstraping

Run the bootstrap script:

```shell
cd ~/dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

Restart the shell and then run `./install-asdf.zsh && chmod +x install-lvim.zsh && ./install-lvim.zsh`

## Features

### VS Code Insiders

VS Code Insiders is set as the default editor - unless in a SSH session, which uses regular `vim`.

The alias `e` is defined to open the default editor.

### prm

This repo includes 
[my fork of the prm project](https://github.com/fabiofortkamp/prm). The `prm` projects
are stored in `~/OneDrive/prm` (the top-level `OneDrive` folder is created if not 
existing).

You can also use the aliases `pst=prm start` and `pt=prm stop`.

### `custom` folder and the `local` script

The scripts in the `custom` folder are executed in alphabetical order; 
the `custom/local.zsh` is also loaded but it is ignored by git. This is a good
place to put local configurations that you don't want to share with the
world.

### Modified `python` plugin

This repo modifies the [python](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/python)
plugin from oh-my-zsh in the following ways:

- there is no `ipython` alias
- the default virtual environment to be used with `mkv` and `vrun` is termed `.venv`

### `lazygit` plugin

This plugin defines the alias `lg` to run [`lazygit`](https://github.com/jesseduffield/lazygit)

### Neovim

This repo uses the [NvChad](https://nvchad.com/) distribution, and the custom folder
is included in the repo. Link the configuration with:

```shell
ln -s ~/dotfiles/config/nvim/lua/custom ~/.config/nvim/lua/custom
```

