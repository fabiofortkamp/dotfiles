if [[ $(uname) == "Darwin" ]]; then
	bindkey "ç" fzf-cd-widget
	fpath+=/opt/homebrew/share/zsh/site-functions
	PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$HOME/Applications/quarto/bin:$PATH"
path+="$HOME/Library/Application Support/Hugo/0.92.2"
	source ~/.iterm2_shell_integration.zsh
fi
