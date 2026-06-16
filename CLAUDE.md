# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## What this repo is

macOS dotfiles for an engineering research workflow, managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a Stow package: running `stow <package>` from `~/dotfiles` creates symlinks under `$HOME` mirroring the package's directory tree.

## How you should work with this repo

### Interaction Rules

* Ask clarifying questions if input is unclear.
* Explain why and suggest alternatives if task is not feasible.
* Use structured, readable formatting (headings, lists, code blocks).
* Follow instructions closely and explain clearly what you have done.
* Don't modify code unrelated to the current task.
* Try always to match the style of the code you are touching.

### Commit Strategy

* One prompt = one commit.
* Each commit:
* Self-contained.
* Includes tests.
* Uses 50/70 commit message format.

## Directory map

| Directory | Destination | Purpose |
|-----------|-------------|---------|
| `fish/` | `~/.config/fish/` | Fish shell config, aliases, PATH setup |
| `nvim/` | `~/.config/nvim/` | Neovim — LazyVim-based, focused on Python/MATLAB/Markdown |
| `tmux/` | `~/.config/tmux/` | Tmux config (prefix: `C-a`, vi keys, TPM plugins) |
| `ghostty/` | `~/.config/ghostty/` | Ghostty terminal config |
| `git/` | `~/.config/git/` | Git config — has personal name/email, change before reusing |
| `mise/` | `~/.config/mise/` | mise tool versions (Go, Python, Ruby, Node, Rust, etc.) |
| `starship/` | `~/.config/starship.toml` | Starship prompt |
| `bin/` | `~/dotfiles/bin/` (on PATH) | Custom scripts |
| `vscode/` | `~/Library/Application Support/Code/User/` | VS Code settings and snippets (linked by `link-editors.sh`) |
| `cursor/` | `~/Library/Application Support/Cursor/User/` | Cursor settings (linked by `link-editors.sh`) |
| `positron/` | `~/Library/Application Support/Positron/User/` | Positron settings (linked by `link-editors.sh`) |

## Key custom scripts (`bin/`)

- **`tmux-sessionizer`** — fuzzy-find projects under `~/personal`, `~/dtu`, `~/polo`, `~/nvim-plugins`, `~/build` and create/switch tmux sessions. Bound to `Ctrl-S` in Fish.
- **`run-command-on-git-revisions`** — run a command across a range of git revisions.

## Fish shell notes

- Secrets (API keys, tokens) go in `~/.config/fish/secrets.fish` — gitignored.
- Shell state in `fish_variables` is gitignored.
- Extensive git aliases are defined in `config.fish`, mirroring Oh-My-Zsh git plugin conventions (`ga`, `gco`, `gst`, etc.).
- `git-town` subcommands are aliased in `~/.config/git/config` (`hack`, `ship`, `sync`, etc.).

## Neovim (`nvim/`)

Based on LazyVim. Plugin overrides live in `nvim/.config/nvim/lua/plugins/`.

## Tool version management

`mise` manages all programming language runtimes. `brew` handles CLI tools and apps. The heuristic: programming languages → mise; everything else → brew.

Local per-project overrides: create `mise.local.toml` in any project (globally gitignored by mise config).
