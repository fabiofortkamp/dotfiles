#!/usr/bin/zsh

LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

mkdir -p "$HOME/.config" && ln -s "$HOME/dotfiles/config/lvim" "$HOME/.config/lvim"
ln -s "$HOME/dotfiles/config/nvim"  $HOME/.config/nvim
mkdir -p "$HOME/.julia" && ln -s "$HOME/dotfiles/julia/config" "$HOME/.julia/config"
