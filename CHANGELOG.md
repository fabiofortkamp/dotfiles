# Changelog

## [1.0.0] - 2026-09-22

### Installation
- Migrated the entire dotfiles installation from GNU Stow to
  [dotbot](https://github.com/anishathalye/dotbot) plus the
  [dotbot-brew](https://github.com/d12frosted/dotbot-brew) plugin, both vendored as
  git submodules.
- Homebrew packages are now declared in a single `Brewfile` and installed via
  `brew bundle`.
- Added Linux bootstrap support, including a no-sudo path (manual Homebrew prefix,
  fish-without-chsh fallback) and a Lima VM target.
- Fixed several bootstrap bugs found by testing on a fresh Lima VM: `PATH` not
  picking up Homebrew's bin directories during non-interactive install steps, the
  removed `git-flow-avh` Homebrew formula (replaced with `git-flow-next`), and
  stale/incompatible native `mise` builds.

### Dev tool management (mise)
- Pruned `mise-config.toml` to the languages actually in active use (lua, node,
  python, uv), dropping Julia, Go, Rust, Ruby, Clojure, Erlang, Gleam, OPAM, ghcup.
- Removed the Julia language-server bootstrap step entirely — it was unreliable,
  and reliably OOM-killed on resource-constrained VMs — along with its supporting
  `julia/` config directory.
- Fixed a `mise-config.toml` TOML syntax bug (tool version must be a string, not an
  array) and missing Homebrew header paths that broke native builds like
  `lua`/`readline`.

### Editor (Neovim)
- Consolidated on a single, actively maintained LazyVim-based Neovim configuration,
  retiring earlier Doom Emacs / Spacemacs / prototype "nvim-advent" experiments.
- Added and refined LSP, completion (blink.cmp + Copilot), and picker (Snacks)
  support across Python, C++/CMake, Ruby/Rails, and Astro/HTML/CSS/JS.
- Standardized Tokyo Night Moon theming across Neovim, tmux, Ghostty, and lazygit.

### Shell & terminal
- Handed Fish plugin management off to fisher (plugin files no longer committed
  directly).
- Added jj (Jujutsu) support, herdr agent-navigation keybindings, and consistent
  tmux/Ghostty/Karabiner configuration.

### Housekeeping
- Removed unused AeroSpace and prototype Ghostty theme-switching configs.
- Flattened single-file config directories to the repo's top level.
