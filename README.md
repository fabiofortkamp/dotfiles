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
- The shell prompt shows the current working directory, git information, and versions of the tools used by the current project;
- For quick listing directories in a pretty manner, try just the `l` abbreviation, or an enhanced `tree` shortcut.

### Neovim as default editor 📝

[Neovim](https://neovim.io/) is the default editor, and uses a [configuration](/nvim/.config/nvim/) based on [LazyVim](https://www.lazyvim.org/).

The configuration is mainly centered around working with Python, Matlab, and Markdown files.
LSP and tree-sitter parsers are fully configured for these languages.

### Package management with homebrew 🍻

[Homebrew](https://brew.sh/) is the default tool to install new packages. See [this script](./brew.sh) for a list
of packages that are installed.

### Dev tool management with mise 🥙

[Mise](https://mise.jdx.dev/) is used to install and use development tools.
See the [configuration](./mise/.config/mise/config.toml).

My heuristic is that, if something is a programming language that I use to do my work, then
it is managed my mise and not by homebrew. The tools that I use (or at least is trying to learn how to use)
are listed in the configuration file linked above.

Some features of my mise configuration:

- Installed tools:
  - Go 1.24.1
  - Lua 5.1
  - Node 22
  - OPAM 2.3.0
  - Python 3.13
  - Ruby  3.3
  - uv (configured to always fetch the latest version)
- Python and uv are integrated; mise with use python version information provided in `uv.lock` files
- You can override the local defaults by placing a file `mise.local.toml` in a project;
this dotfiles configuration automatically ignores this filename in git for all repos;
- [Idiomatic version files](https://mise.jdx.dev/configuration.html#idiomatic-version-files) are 
disabled to be parsed by mise;
- For all ruby versions, [these gems](./default-gems) are installed by default.
