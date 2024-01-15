#!/usr/bin/bash

if [[ $(uname) == "Darwin" ]]; then
	# macOS configuration

	# Install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# Link zsh config
	rm ~/.zshrc && ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

	# Install rustup
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	# Install Homebrew
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	(
		echo
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
	) >>/Users/fpfortkamp/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"

	brew install bat exa coreutils tmux libyaml gh

	# Install juliaup
	curl -fsSL https://install.julialang.org | sh

	# Install asdf
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.13.1
	brew install openssl readline sqlite3 xz zlib tcl-tk

	source $HOME/dotfiles/zshrc

	zsh $HOME/dotfiles/install-asdf.zsh

	mkdir -p "$HOME/.config/mypy"
	ln -s "$HOME/dotfiles/config/mypy/config" "$HOME/.config/mypy/config"

	mkdir -p "$HOME/.config/ruff"
	ln -s "$HOME/dotfiles/config/ruff/ruff.toml" "$HOME/.config/ruff/ruff.toml"

	ln -s "$HOME/dotfiles/config/tmux/tmux.conf" "$HOME/.config/tmux"

	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	~/.tmux/plugins/tpm/bin/install_plugins
else
	# Ubuntu configuration
	sudo apt update

	# Install zsh
	sudo apt install zsh curl

	# Install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	command -v zsh | sudo tee -a /etc/shells

	sudo chsh -s $(which zsh) $USER

	# Link zsh config
	rm ~/.zshrc && ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"

	# Install rustup
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

	# Install bat and exa
	sudo apt install bat exa
	mkdir -p ~/.local/bin
	ln -s /usr/bin/batcat ~/.local/bin/bat

	# Install the Hack Nerd Font
	sudo apt install zip unzip
	mkdir -p ~/.local/share/fonts
	cd ~/.local/share/fonts && curl -fLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
	unzip Hack.zip
	fc-cache -f

	# Install asdf and plugins
	sudo apt install build-essential libssl-dev zlib1g-dev \
		libbz2-dev libreadline-dev libsqlite3-dev curl \
		libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev
	git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

	# Install Juliaup
	curl -fsSL https://install.julialang.org | sh

	# Install NvChad
	git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

	cd $HOME/dotfiles
	chmod +x install-asdf.zsh

	mkdir -p "$HOME/.config/mypy"
	ln -s "$HOME/dotfiles/config/mypy/config" "$HOME/.config/mypy/config"

	mkdir -p "$HOME/.config/ruff"
	ln -s "$HOME/dotfiles/config/ruff/ruff.toml" "$HOME/.config/ruff/ruff.toml"

	ln -s "$HOME/dotfiles/config/tmux" "$HOME/.config/tmux"

	mkdir -p "$HOME/.config/tilix/"

	ln -s "$HOME/dotfiles/config/tilix/schemes" "$HOME/.config/tilix/schemes"

	source "$HOME/zshrc"
	source "$HOME/dotfiles/install-asdf.zsh"
	source "$HOME/dotfiles/install-lvim.zsh"
fi
