# set up homebrew path
fish_add_path -gP /opt/homebrew/bin/ /opt/homebrew/sbin/

# zoxide config
zoxide init fish | source

# Set up fzf key bindings
fzf --fish | source
