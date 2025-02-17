# set up homebrew path
fish_add_path -gP /opt/homebrew/bin/ /opt/homebrew/sbin/

fish_add_path -gP "$HOME/.local/bin"
# create local dotfiles scripts dir
fish_add_path -gP "$HOME/dotfiles/bin"

# set vi keybindings
set -g fish_key_bindings fish_vi_key_bindings

# set up tmux-sessionizer keybindings
bind \cs -M "default" "$HOME/dotfiles/bin/tmux-sessionizer"
bind \cs -M "insert" "$HOME/dotfiles/bin/tmux-sessionizer"

# zoxide config
zoxide init fish | source

# Set up fzf key bindings
fzf --fish | source
