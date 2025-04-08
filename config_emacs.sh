#!/usr/bin/env bash

set -e

# Clone my fork of chemacs
git clone git@github.com:fabiofortkamp/chemacs2.git "$HOME/.emacs.d"

# Clone spacemacs
git clone https://github.com/syl20bnr/spacemacs "$HOME/spacemacs"

# Clone doom emacs
git clone https://github.com/hlissner/doom-emacs "$HOME/doom-emacs"
"$HOME/doom-emacs/bin/doom" install
