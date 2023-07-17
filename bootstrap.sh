#!/usr/bin/bash

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
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0

# Install Juliaup
curl -fsSL https://install.julialang.org | sh

cd $HOME/dotfiles
chmod +x install-asdf.zsh
