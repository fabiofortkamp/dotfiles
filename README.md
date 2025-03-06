# dotfiles

macOS-based configuration for a engineering research workflow focused on the commmand line.

This is what suits me. Please notice that, in particular, [git](./git/) and [GitHub CLI client](./gh/)
have my username, so you should change those settings.


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

### Fish as the default shell 🐟

[Fish](https://fishshell.com/) is set as the default shell, with [replacements](./fish/.config/fish/config.fish)
for git and [eza](https://github.com/eza-community/eza). [Fzf](https://github.com/junegunn/fzf), [atuin](https://docs.atuin.sh/) (in offline mode) and [zoxide](https://github.com/ajeetdsouza/zoxide) are also initialized.

The prompt is managed by the [starship](https://starship.rs/guide/) [configuration](./starship/.config/starship.toml).

Some features of the shell:

- `git` and `gh` clients fully configured;
- Helpful `TAB ⇥` completion for many commands; e.g. run `gh <TAB>` to see available
subcommands and their descriptions;
- In the shell, press `<CTRL-R>` to fuzzy search history; while in the search window, press
`<CTRL-R>` again to alternate between search scopes (all commands typed in this git workspace, directory, shell session, or the host);
- Change directories with the `z` command, which remembers your navigation history; for instance, you should be able to `z dotfiles` from any location and jump into this dotfiles 
directory;
- When searching for a file to use as an argument for something, run `CTRL-T` to use `fzf` fuzzy finder; press enter to paste the full path back into the shell;
- The shell prompt shows the current working directory, git information, and versions of the tools used by the current project.

### Neovim as default editor 📝

[Neovim](https://neovim.io/) is the default editor, and uses a [configuration](/nvim/.config/nvim/) based on [LazyVim](https://www.lazyvim.org/).

The configuration is mainly centered around working with Python, Matlab, and Markdown files.
LSP and tree-sitter parsers are fully configured for these languages.

### Package management with homebrew 🍻

[Homebrew](https://brew.sh/) is the default tool to install new packages.

### Dev tool management with mise 🥙

[Mise](https://mise.jdx.dev/) is used to install and use development tools, and is automatically configured.
See the [configuration](./mise/.config/mise/config.toml).
