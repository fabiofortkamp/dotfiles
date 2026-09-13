#!/usr/bin/env bash
set -euo pipefail

fish_path="$(command -v fish)"

grep -qxF "$fish_path" /etc/shells || echo "$fish_path" | sudo tee -a /etc/shells

if [ "$(uname)" = "Darwin" ]; then
  current_shell="$(dscl . -read "$HOME" UserShell 2>/dev/null | awk '{print $2}')"
else
  current_shell="$(getent passwd "$USER" | cut -d: -f7)"
fi

[ "$current_shell" = "$fish_path" ] || chsh -s "$fish_path"
