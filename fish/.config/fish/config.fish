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

# add MATLAB and COMSOL to PATH
# only macOS supported for not
function add_to_path_if_exists
    for file in $argv
        if test -e $file
            fish_add_path -gP $file
        end
    end
end

add_to_path_if_exists /Applications/COMSOL63/Multiphysics/bin
add_to_path_if_exists "/Applications/MATLAB_R2024b.app/bin"
add_to_path_if_exists "/Applications/Blender.app/Contents/MacOS"

# common variables
set -gx EDITOR nvim
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_DATA_HOME "$HOME/.local/share/"
set -gx XDG_CACHE_HOME "$HOME/.cache/"
set -gx TMP /tmp
set -gx PYTEST_DEBUG_TEMPROOT /tmp
set -gx XDG_RUNTIME_DIR "$TMP/run/$USER"

mise activate fish | source
