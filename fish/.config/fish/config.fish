# set up homebrew path
fish_add_path -gP /opt/homebrew/bin/ /opt/homebrew/sbin/

fish_add_path -gP "$HOME/.local/bin"
# create local dotfiles scripts dir
fish_add_path -gP "$HOME/dotfiles/bin"

# set vi keybindings
set -g fish_key_bindings fish_vi_key_bindings

# set up tmux-sessionizer keybindings
bind \cs -M default "$HOME/dotfiles/bin/tmux-sessionizer"
bind \cs -M insert "$HOME/dotfiles/bin/tmux-sessionizer"

# zoxide config
zoxide init fish | source

# Set up fzf key bindings
fzf --fish | source

# ASDF configuration code
fish_add_path -gP "$HOME/.asdf/bin"
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
