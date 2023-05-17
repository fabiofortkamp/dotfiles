# aliases for commands rewritten in rust
# https://zaiste.net/posts/shell-commands-rust/

# Inspiration: https://www.youtube.com/watch?v=sjrW74Hx5Po

# https://stackoverflow.com/questions/7522712/how-can-i-check-if-a-command-exists-in-a-shell-script

if ! type "$exa" > /dev/null; then
  alias ls="exa --icons"
fi

if ! type "$bat" > /dev/null; then
  alias cat="bat --style=auto"
fi
