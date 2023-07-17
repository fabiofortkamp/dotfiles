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

### LunarVim

LunarVim is set as the default editor - unless in a SSH session, which uses regular `vim`.

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
