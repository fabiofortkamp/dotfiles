#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/Library/Application Support"

[[ -d "$BASE/Code/User" ]]     && ln -sf "$DOTFILES/vscode/settings.json"   "$BASE/Code/User/settings.json"
[[ -d "$BASE/Cursor/User" ]]   && ln -sf "$DOTFILES/cursor/settings.json"   "$BASE/Cursor/User/settings.json"
[[ -d "$BASE/Positron/User" ]] && ln -sf "$DOTFILES/positron/settings.json" "$BASE/Positron/User/settings.json"

if [[ -d "$BASE/Code/User/snippets" ]]; then
  for f in "$DOTFILES/vscode/snippets/"*.json; do
    ln -sf "$f" "$BASE/Code/User/snippets/$(basename "$f")"
  done
fi
