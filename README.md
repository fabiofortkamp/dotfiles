# dotfiles

Ubuntu-based configuration for zsh, Neovim, LunarVim and Julia.

## Installation

### Pre-requisites

1. (Ubuntu:) Install git:

```shell
sudo apt install git
git config --global user.name "<NAME>"
git config --global user.email "<email>"
```

2. Install [VS Code Insiders](https://code.visualstudio.com/insiders/);
3. (Ubuntu only): run:

```shell
sudo apt update && sudo install zsh curl
command -v zsh | sudo tee -a /etc/shells
sudo chsh -s $(which zsh) $USER

```

4. Install [Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh);
5. Install [Homebrew](https://brew.sh/) - follow the on-screen instructions;
6. Install [asdf](https://asdf-vm.com/);
   Then, clone this repo:

```shell

git clone --recursive https://github.com/fabiofortkamp/dotfiles ~/dotfiles
```

### Bootstraping

Start a new shell and see if you get the default oh-my-zsh prompt; you might get some
errors about missing packages - that's OK for now.

Now, run the bootstrap script in this directory:

#### Linux

Run the bootstrap script:

```shell
cd ~/dotfiles
chmod +x bootstrap.sh
./bootstrap.sh
```

Restart the shell and then run `./install-asdf.zsh && chmod +x install-lvim.zsh && ./install-lvim.zsh`

#### macOS

```shell
cd ~/dotfiles
chmod +x bootstrap.sh
zsh bootstrap.sh
```

### Post-bootstrap

## Features

### Default editor

Neovim (`nvim`) is set as the default editor - unless in a SSH session, which uses regular `vim`.

My current neovim configuration is not included in this repo, but uses [AstroNvim](https://github.com/fabiofortkamp/astronvim_config).

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

### ruff and mypy configuration

There are default [ruff](https://docs.astral.sh/ruff/) and [mypy](https://mypy.readthedocs.io/en/stable/index.html)
configuration files.

The ruff file enables more checks, in particular docstrings, and enforces Google-style ones.

The mypy file ignores missing imports.

### tmux and tmuxinator

After bootstraping, install [tmuxinator](https://github.com/tmuxinator/tmuxinator) with `gem install tmuxinator`.

This repo assumes a PARA-like setup with tmuxinator files at `$HOME/OneDrive/2-Areas/tmuxinator/`. A link at `$HOME/.config/tmuxinator` is
created at this location, and the `$TMUXINATOR_CONFIG` environment variable points to this latter location.

Some additional configuration steps are needed. First, download TPM (tmux plugin manager) with:

```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.config/tmux/tmux.conf
```

Then, start a tmux session and press `C-a I` to install all plugins and finish configure tmux.
