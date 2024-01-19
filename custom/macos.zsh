if [[ $(uname) == "Darwin" ]]; then
	fpath+=/opt/homebrew/share/zsh/site-functions
	PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

	source ~/.iterm2_shell_integration.zsh
fi
