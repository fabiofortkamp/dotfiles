# aliases for commands rewritten in rust
# https://zaiste.net/posts/shell-commands-rust/

# Inspiration: https://www.youtube.com/watch?v=sjrW74Hx5Po

# https://stackoverflow.com/questions/7522712/how-can-i-check-if-a-command-exists-in-a-shell-script

if type "eza" > /dev/null; then
  alias ls="eza --icons"
fi

if type "bat" > /dev/null; then
  alias bat="bat --style=auto --theme=OneHalfDark"
fi
