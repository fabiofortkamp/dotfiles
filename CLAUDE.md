# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## What this repo is

Dotfiles for an engineering research workflow, managed with [dotbot](https://github.com/anishathalye/dotbot), vendored as a git submodule (`dotbot/`) along with the [dotbot-brew](https://github.com/d12frosted/dotbot-brew) plugin (`dotbot-brew/`). `./install` runs `install.conf.yaml`, which symlinks top-level directories and files into `$HOME` (mapping is explicit per entry — unlike Stow, sources don't need to mirror the `$HOME` path they target) and installs Homebrew packages from `Brewfile` via the `brewfile` directive.

Primarily macOS, but also used on Linux — `dotbot-brew` bootstraps Homebrew under Linuxbrew there. Consequence for anything you add here: **never hardcode a Homebrew prefix**, since it is `/opt/homebrew` on Apple Silicon but `/home/linuxbrew/.linuxbrew` on Linux. Prefer tools resolved from `PATH`, or installed by Mason in the Neovim config.

### No-sudo Linux bootstrap

`./install` is meant to work on a Linux box with no sudo access at all. Two things that would otherwise need it are handled:

- **Homebrew**: `dotbot-brew`'s auto-installer defaults to `/home/linuxbrew/.linuxbrew`, which typically needs sudo the first time. `install` runs a preflight check before dotbot starts (before `cd "${BASEDIR}"`) that detects "no brew found + no usable sudo" on Linux and fails fast with instructions to pre-install Homebrew into a user-owned prefix (`~/.linuxbrew`) instead. This lives in `install` itself, not `install.conf.yaml`, because dotbot's shell plugin defaults to `exit_on_failure=False` and would keep running later directives (like `brewfile:`) even after a failed check.
- **fish as the shell**: setting it via `chsh` requires sudo (PAM's `pam_shells.so` refuses a shell not listed in `/etc/shells`, and only root can edit that file). Rather than depending on that, Ghostty (`command = fish`) and WezTerm (`config.default_prog`) are configured to launch fish directly, bypassing the OS login-shell mechanism entirely. `set-default-shell.sh` still tries `chsh` first (works fine when sudo is available) but prints manual alternatives (a `~/.bashrc` `exec fish` guard, or `RemoteCommand fish` in `~/.ssh/config` on the connecting machine) and exits 0 instead of aborting the bootstrap when it can't.

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
| `ghostty/` | `~/.config/ghostty/` | Ghostty terminal config |
| `git/` | `~/.config/git/` | Git config — has personal name/email, change before reusing |
| `bin/` | `~/dotfiles/bin/` (on PATH) | Custom scripts |
| `clang/` | `~/.clang-format`, `~/.clang-tidy` | Global C/C++ style and lint config (bare dotfiles — clang tooling has no XDG support and only walks parent directories) |
| `vscode/` | `~/Library/Application Support/Code/User/` | VS Code settings and snippets |
| `cursor/` | `~/Library/Application Support/Cursor/User/` | Cursor settings |
| `positron/` | `~/Library/Application Support/Positron/User/` | Positron settings |

### Single-file configs live at the top level

A tool whose config is a single file gets that file at the repo root rather than a
directory of its own — `starship.toml`, `tmux.conf`, `wezterm.lua`, `atuin.toml`,
`jj.toml`, `lazygit.yml`, `mise-config.toml`, `ruff-config.toml`, `mypy-config.ini`.
Because `install.conf.yaml` maps every entry explicitly, the source name is free, so
files are renamed where the destination name is generic (four tools want
`config.toml`). The `-config` suffix on mise/ruff/mypy is deliberate: a root-level
`mise.toml`, `ruff.toml` or `mypy.ini` would be auto-discovered as *project* config
by those tools whenever the cwd is inside `~/dotfiles`, since they all walk up from
the working directory.

Three single-file directories stay directories on purpose, and are symlinked whole:

- `gh/` — `gh config set` and `gh auth login` rewrite `config.yml` by writing a temp
  file and renaming over it, which would replace a symlinked file with a real one.
  The whole-dir link also keeps the gitignored `hosts.yml` (auth token) working.
- `karabiner/` — Karabiner-Elements saves `karabiner.json` from the GUI the same way,
  and writes `automatic_backups/` next to it.
- `herdr/` — resolves `sounds/` and its plugin lock relative to the config directory,
  and writes logs, sockets and `session.json` there (all gitignored).

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

Based on LazyVim. Plugin overrides live in `nvim/lua/plugins/`.

Enabled LazyVim extras are listed in `nvim/lazyvim.json`: `lang.clangd` and
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

### Native mise builds may need Homebrew's headers pointed at explicitly

`brew shellenv` is never sourced here (`fish/config.fish` only adds `bin`/`sbin` to `PATH`), so a
tool mise builds from source won't find a Homebrew-installed C library's headers/libs on its own —
Homebrew doesn't inject `CPATH`/`LIBRARY_PATH` globally, on Linux or macOS. `lua` is the example:
it needs `readline` (in `Brewfile`), and `CPATH`/`LIBRARY_PATH` pointed at `$(brew --prefix)` —
done as a plain shell prefix on the `mise install` command in `install.conf.yaml`, not inside
`mise-config.toml`.

**Do not put an `exec(command=...)` template anywhere in `mise-config.toml`'s `[tools]` table**
(this includes a tool's `install_env`, despite docs implying it's install-scoped) — mise re-renders
the *entire* config, all `[tools]` fields included, on every config parse, not just during an
actual `mise install`. That includes plain shell activation (`mise activate fish`'s hook firing on
every new prompt). A `brew`-dependent template there broke every new shell on every machine
(`mise ERROR failed to parse template ... command ["sh", ...] exited with code 127`) once `brew`
wasn't resolvable in whatever minimal environment mise's internal `exec()` runs with — which isn't
guaranteed to be the live, `fish_add_path`-populated `$PATH` of an interactive shell. Anything that
needs `brew --prefix` belongs in the one bootstrap command that actually needs it, computed as a
plain `$(...)` shell substitution at the moment that command runs — never as a persisted template
in the config file mise re-parses constantly.

`install.conf.yaml` also runs `mise plugins update` right before `mise install`, since a plugin
git-cloned once and never refreshed can keep carrying a bug already fixed upstream (this bit us
with the `lua` asdf plugin's bundled LuaRocks rockspec, which needed a one-line sed patch that a
stale local plugin clone didn't have yet).

### `~/.local/bin` shadows Homebrew

`config.fish` adds `$HOME/.local/bin` after Homebrew, and `fish_add_path` prepends, so
`~/.local/bin` wins. It legitimately holds `nvim`, `mise`, `uv`, `zig` and the pipx/uv
shims — but anything installed there silently overrides a brew formula.

A self-built LLVM 19 (+assertions) and a git-snapshot CMake 4 lived there until 2026-08-28,
shadowing `clang`, `clang-format`, `cmake`, `ctest` and `cpack` system-wide. They were moved
to `~/.local/llvm-19-selfbuilt/` (see the README there). Don't reinstall a C/C++ toolchain
into `~/.local/bin` — use brew, so versions stay reproducible from `Brewfile`.
