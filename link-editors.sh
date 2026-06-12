#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/Library/Application Support"

ln -sf "$DOTFILES/vscode/settings.json"   "$BASE/Code/User/settings.json"
ln -sf "$DOTFILES/cursor/settings.json"   "$BASE/Cursor/User/settings.json"
ln -sf "$DOTFILES/positron/settings.json" "$BASE/Positron/User/settings.json"

for f in "$DOTFILES/vscode/snippets/"*.json; do
  ln -sf "$f" "$BASE/Code/User/snippets/$(basename "$f")"
done
