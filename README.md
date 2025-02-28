# dotfiles

macOS-based configuration for a engineering research workflow focused on the commmand line.

## Installation

### Pre-requisites
- git
- bash
- curl

### Running the installation script

Run the following commands in a shell:
```shell

git clone --recursive https://github.com/fabiofortkamp/dotfiles ~/dotfiles
./install.sh
```

## Features

### Fish as the default shell

[Fish](https://fishshell.com/) is set as the default shell, with [replacements](./fish/.config/fish/config.fish)
for git and [eza](https://github.com/eza-community/eza). [Fzf](https://github.com/junegunn/fzf), [atuin](https://docs.atuin.sh/) (in offline mode) and [zoxide](https://github.com/ajeetdsouza/zoxide) are also initialized.

The prompt is managed by the [starship](https://starship.rs/guide/) [configuration](./starship/.config/starship.toml).

### Neovim as default editor

[Neovim](https://neovim.io/) is the default editor, and uses a [configuration](/nvim/.config/nvim/) based on [LazyVim](https://www.lazyvim.org/).

The configuration is mainly centered around working with Python, Matlab, and Markdown files.

### Package management with homebrew

[Homebrew](https://brew.sh/) is the default tool to install new packages.

### Dev tool management with mise

[Mise](https://mise.jdx.dev/) is used to install and use new tools, and is automatically configured.
See the [configuration](./mise/.config/mise/config.toml).
