#!/usr/bin/zsh

asdf plugin add python
asdf install python 3.6.15
asdf install python 3.11.4
asdf global python 3.11.4

asdf plugin add lazygit
asdf install lazygit latest
asdf global lazygit latest

asdf plugin add neovim
asdf install neovim stable
asdf global neovim stable

asdf plugin add nodejs
asdf install nodejs 18.16.0
asdf global nodejs 18.16.0

asdf plugin add golang
asdf install golang 1.21.6
asdf global golang 1.21.6

asdf plugin add ruby
asdf install ruby 3.3.0
asdf global ruby 3.3.0


