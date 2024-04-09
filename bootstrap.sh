#!/usr/bin/bash

# Link zsh config
rm ~/.zshrc && ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

# Install rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install juliaup
curl -fsSL https://install.julialang.org | sh

./brew.sh
./brew-config.sh
./install-asdf.zsh

if [[ $(uname) == "Darwin" ]]; then
	# macOS configuration


	curl -L https://iterm2.com/shell_integration/zsh -o ~/.iterm2_shell_integration.zsh

else

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
fi


# Recommendations from Manning's
# "Publishing Python Packages"
pipx install build cookiecutter tox pre-commit hatch uv ruff mypy poetry

# A command to replace a previous wrongly-entered mistake
pipx install thefuck

## Manual rust-based (Cargo) installation
# https://eza.rocks/
"$HOME/.cargo/bin/cargo" install eza

curl -sSf https://rye-up.com/get | bash

