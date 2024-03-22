#!/usr/bin/zsh

asdf plugin add python
asdf install python 3.6.15
asdf install python 3.11.4
asdf install python 3.12.2
asdf install python 3.10.13
asdf install python 3.9.18
asdf install python 3.8.18
asdf install python 3.7.17
asdf global python 3.12.2 3.11.4 3.10.13 3.9.18 3.8.18 3.7.17 3.6.15

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

asdf plugin add java
asdf install java openjdk-21.0.1
asdf global java openjdk-21.0.1

asdf plugin add haskell
asdf install haskell 9.8.2
asdf global haskell 9.8.2
