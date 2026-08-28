# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## What this repo is

Dotfiles for an engineering research workflow, managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a Stow package: running `stow <package>` from `~/dotfiles` creates symlinks under `$HOME` mirroring the package's directory tree.

Primarily macOS, but also used on Linux — `brew.sh` runs under Linuxbrew. Consequence for anything you add here: **never hardcode a Homebrew prefix**, since it is `/opt/homebrew` on Apple Silicon but `/home/linuxbrew/.linuxbrew` on Linux. Prefer tools resolved from `PATH`, or installed by Mason in the Neovim config.

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
| `nvim/` | `~/.config/nvim/` | Neovim — LazyVim-based, focused on Python/C++/MATLAB/Markdown |
| `tmux/` | `~/.config/tmux/` | Tmux config (prefix: `C-a`, vi keys, TPM plugins) |
| `ghostty/` | `~/.config/ghostty/` | Ghostty terminal config |
| `git/` | `~/.config/git/` | Git config — has personal name/email, change before reusing |
| `mise/` | `~/.config/mise/` | mise tool versions (Go, Python, Ruby, Node, Rust, etc.) |
| `starship/` | `~/.config/starship.toml` | Starship prompt |
| `bin/` | `~/dotfiles/bin/` (on PATH) | Custom scripts |
| `clang/` | `~/.clang-format`, `~/.clang-tidy` | Global C/C++ style and lint config (bare dotfiles — clang tooling has no XDG support and only walks parent directories) |
| `vscode/` | `~/Library/Application Support/Code/User/` | VS Code settings and snippets (linked by `link-editors.sh`) |
| `cursor/` | `~/Library/Application Support/Cursor/User/` | Cursor settings (linked by `link-editors.sh`) |
| `positron/` | `~/Library/Application Support/Positron/User/` | Positron settings (linked by `link-editors.sh`) |

## Key custom scripts (`bin/`)

- **`tmux-sessionizer`** — fuzzy-find projects under `~/personal`, `~/dtu`, `~/polo`, `~/nvim-plugins`, `~/build` and create/switch tmux sessions. Bound to `Ctrl-S` in Fish.
- **`run-command-on-git-revisions`** — run a command across a range of git revisions.
- **`new-cpp-project <path>`** — scaffold a C++ project: CMake + Ninja + CMakePresets (`dev`/`asan`/`release`), a library target plus a thin `main.cpp`, and Catch2 v3 tests registered with CTest via `catch_discover_tests()`. The presets export `compile_commands.json`, which is what makes clangd work.

## Fish shell notes

- Secrets (API keys, tokens) go in `~/.config/fish/secrets.fish` — gitignored.
- Shell state in `fish_variables` is gitignored.
- Extensive git aliases are defined in `config.fish`, mirroring Oh-My-Zsh git plugin conventions (`ga`, `gco`, `gst`, etc.).
- `git-town` subcommands are aliased in `~/.config/git/config` (`hack`, `ship`, `sync`, etc.).
- Fish plugins are managed by [fisher](https://github.com/jorgebucaran/fisher). Only `fish_plugins` (the plugin list) is committed; the installed plugin files under `functions/`, `conf.d/`, `completions/` are gitignored because fisher owns them. Update with `fisher update`; on a fresh machine, bootstrap with:
  ```fish
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
  ```
  Do **not** commit the plugin files — doing so desyncs them from fisher's ledger (a gitignored universal variable) and makes `fisher update` fail with "conflicting files".

## Neovim (`nvim/`)

Based on LazyVim. Plugin overrides live in `nvim/.config/nvim/lua/plugins/`.

Enabled LazyVim extras are listed in `nvim/.config/nvim/lazyvim.json`: `lang.clangd` and
`dap.core`. Both are needed — the clangd extra's nvim-dap block is `optional = true`, so
without `dap.core` it silently installs no debugger.

For C++, `lsp.lua` picks the clangd binary at runtime: Xcode's `/usr/bin/clangd` on macOS,
Mason's elsewhere. This is not cosmetic — an upstream clangd cannot parse Apple's SDK headers
(it fails on `unknown type name '__uint32_t'`) even with a correct `-isysroot`, while Xcode's
matches the SDK it ships with. `--query-driver` is also set, so clangd asks the compiler named
in `compile_commands.json` where its system headers are.

`cmake-tools.nvim` (`<leader>m…`) drives the build and symlinks `compile_commands.json` to the
project root — if C++ completion is ever silently dead, check that symlink first. `neotest` +
`neotest-ctest` (`<leader>t…`) run individual tests, which works because the scaffold registers
them with `catch_discover_tests()`.

## Tool version management

`mise` manages all programming language runtimes. `brew` handles CLI tools and apps. The heuristic: programming languages → mise; everything else → brew.

Local per-project overrides: create `mise.local.toml` in any project (globally gitignored by mise config).

### `~/.local/bin` shadows Homebrew

`config.fish` adds `$HOME/.local/bin` after Homebrew, and `fish_add_path` prepends, so
`~/.local/bin` wins. It legitimately holds `nvim`, `mise`, `uv`, `zig` and the pipx/uv
shims — but anything installed there silently overrides a brew formula.

A self-built LLVM 19 (+assertions) and a git-snapshot CMake 4 lived there until 2026-08-28,
shadowing `clang`, `clang-format`, `cmake`, `ctest` and `cpack` system-wide. They were moved
to `~/.local/llvm-19-selfbuilt/` (see the README there). Don't reinstall a C/C++ toolchain
into `~/.local/bin` — use brew, so versions stay reproducible from `brew.sh`.
