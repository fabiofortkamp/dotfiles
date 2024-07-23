if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Homebrew config
set -gx HOMEBREW_PREFIX "/home/linuxbrew/.linuxbrew";
set -gx HOMEBREW_CELLAR "/home/linuxbrew/.linuxbrew/Cellar";
set -gx HOMEBREW_REPOSITORY "/home/linuxbrew/.linuxbrew/Homebrew";
fish_add_path -gP "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin";
! set -q MANPATH; and set MANPATH ''; set -gx MANPATH "/home/linuxbrew/.linuxbrew/share/man" $MANPATH;
! set -q INFOPATH; and set INFOPATH ''; set -gx INFOPATH "/home/linuxbrew/.linuxbrew/share/info" $INFOPATH;

# Starship config
starship init fish | source

# asdf config
source ~/.asdf/asdf.fish

# zoxide config
zoxide init fish | source

# git aliases
abbr -a g git
abbr -a ga 'git add'
abbr -a gpoat git push origin --all; and git push origin --tags
abbr -a gcmsg 'git commit -m'
abbr -a ggpull 'git pull origin $(git_current_branch)'

# tmux aliases
abbr -a ts 'tmux new-session -s'
abbr -a ta 'tmux attach -t'
abbr -a tl 'tmux list-sessions'
abbr -a tkss 'tmux kill-session -t'
