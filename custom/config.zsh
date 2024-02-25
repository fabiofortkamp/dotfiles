export XDG_CONFIG_HOME="$HOME/.config"

alias elvim='$EDITOR $XDG_CONFIG_HOME/lvim'
alias envim='$EDITOR $XDG_CONFIG_HOME/nvim'
alias elocal='$EDITOR $HOME/dotfiles/custom/local.zsh'
ZSH_AUTOSUGGEST_STRATEGY=(completion history)

## fzf config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
