#!/usr/bin/bash

# Link zsh config
rm ~/.zshrc && ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install juliaup
curl -fsSL https://install.julialang.org | sh

# Place configuration files
mkdir -p "$HOME/.config/mypy"
ln -s "$HOME/dotfiles/config/mypy/config" "$HOME/.config/mypy/config"

mkdir -p "$HOME/.config/ruff"
ln -s "$HOME/dotfiles/config/ruff/ruff.toml" "$HOME/.config/ruff/ruff.toml"

ln -s "$HOME/dotfiles/config/tmux" "$HOME/.config/tmux"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
~/.tmux/plugins/tpm/bin/install_plugins

ln -s "$HOME/OneDrive/2-Areas/tmuxinator" "$HOME/.config/tmuxinator"

ln -s "$HOME/dotfiles/julia/config" "$HOME/.julia/config"

if [[ $(uname) == "Darwin" ]]; then
	# macOS configuration

	brew install bat coreutils tmux libyaml gh ripgrep fd php

	curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

	# fzf is a fuzzy finder that can filter list outputs
	# it's used by zoxide above
	# https://github.com/junegunn/fzf
	brew install fzf
else
	# Ubuntu configuration
	# Install bat
	sudo apt install bat
	mkdir -p ~/.local/bin
	ln -s /usr/bin/batcat ~/.local/bin/bat

	# Install the Hack Nerd Font
	sudo apt install zip unzip
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
	unzip Hack.zip
	fc-cache -f
	cd ~/dotfiles || return

	sudo apt install build-essential libssl-dev zlib1g-dev \
		libbz2-dev libreadline-dev libsqlite3-dev curl \
		libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

	# fzf is a fuzzy finder that can filter list outputs
	# it's used by zoxide above
	# https://github.com/junegunn/fzf
	sudo apt install fzf

	mkdir -p "$HOME/.config/tilix/"

	ln -s "$HOME/dotfiles/config/tilix/schemes" "$HOME/.config/tilix/schemes"

fi

# Homebrew packages that should be common to all systems
brew install pipx python-launcher
pipx ensurepath

brew install gh git-flow-avh zoxide tree gojq openssl cmake luarocks

# ripgrep is a more modern grep
# https://github.com/BurntSushi/ripgrep
# fd is a more modern find
# https://github.com/sharkdp/fd
brew install ripgrep fd

# Recommendations from Manning's
# "Publishing Python Packages"
pipx install build cookiecutter tox pre-commit hatch uv ruff mypy

# A command to replace a previous wrongly-entered mistake
pipx install thefuck
## Cargo installations
# https://eza.rocks/
cargo install eza
