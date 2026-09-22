#!/usr/bin/env bash
set -uo pipefail # no -e: failures here are handled explicitly, not fatal

fish_path="$(command -v fish)"

print_guidance() {
  cat <<EOF
Could not set fish as the login shell (no usable sudo on this machine).
fish is still usable without this:

  - If you're using Ghostty or WezTerm from this repo's dotfiles, they
    already launch fish directly (see ghostty/config, wezterm.lua) --
    nothing else to do.
  - For a plain bash session (e.g. a bare SSH terminal), add to ~/.bashrc:
        if [[ \$- == *i* ]] && command -v fish >/dev/null 2>&1; then
          exec fish
        fi
  - If you're connecting to this machine over SSH from elsewhere, you can
    instead set this in ~/.ssh/config on the machine you connect FROM:
        Host <this-vm>
            RemoteCommand fish
            RequestTTY yes
EOF
}

if ! grep -qxF "$fish_path" /etc/shells; then
  if ! echo "$fish_path" | sudo tee -a /etc/shells >/dev/null; then
    print_guidance
    exit 0
  fi
fi

if [ "$(uname)" = "Darwin" ]; then
  current_shell="$(dscl . -read "$HOME" UserShell 2>/dev/null | awk '{print $2}')"
else
  current_shell="$(getent passwd "$USER" | cut -d: -f7)"
fi

if [ "$current_shell" != "$fish_path" ]; then
  chsh -s "$fish_path" || print_guidance
fi
