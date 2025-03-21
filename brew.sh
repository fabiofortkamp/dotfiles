#!/usr/bin/env bash
# stolen from https://github.com/CoreyMSchafer/dotfiles/blob/master/brew.sh

# Install Homebrew if it isn't already installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not installed. Installing Homebrew."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Attempt to set up Homebrew PATH automatically for this session
  if [ -x "/opt/homebrew/bin/brew" ]; then
    # For Apple Silicon Macs
    echo "Configuring Homebrew in PATH for Apple Silicon Mac..."
    export PATH="/opt/homebrew/bin:$PATH"
  fi

  if [ -x "/home/linuxbrew/.linuxbrew/bin/brew" ]; then

    # For Linux
    echo "Configuring Homebrew in PATH for Linux..."
    export PATH="/home/linuxbrew/.linuxbrew/bin/:$PATH"
  fi
else
  echo "Homebrew is already installed."
fi

# Verify brew is now accessible
if ! command -v brew &>/dev/null; then
  echo "Failed to configure Homebrew in PATH. Please add Homebrew to your PATH manually."
  exit 1
fi

# Update Homebrew and Upgrade any already-installed formulae
brew update
brew upgrade
brew cleanup

# Define an array of packages to install using Homebrew.
packages=(
  "atuin"
  "autoconf"
  "automake"
  "bash"
  "bat"
  "bison"
  "bottom"
  "cairo"
  "cmake"
  "coreutils"
  "curl"
  "direnv"
  "fd"
  "fish"
  "freetype"
  "fzf"
  "gcc"
  "gd"
  "gdu"
  "gettext"
  "gh"
  "git"
  "git-flow-avh"
  "goawk"
  "gojq"
  "icu4c"
  "krb5"
  "libedit"
  "libiconv"
  "libjpeg"
  "libpng"
  "libxml2"
  "libyaml"
  "libzip"
  "mise"
  "ninja"
  "open-mpi"
  "opencoarrays"
  "openssl"
  "pango"
  "php"
  "pipx"
  "pkg-config"
  "python-launcher"
  "re2c"
  "ripgrep"
  "ruff"
  "starship"
  "stow"
  "texinfo"
  "texlab"
  "texlive"
  "tmux"
  "tree"
  "wget"
  "zlib"
  "zoxide"
  "zsh"
)

# Loop over the array to install each application.
for package in "${packages[@]}"; do
  if brew list --formula | grep -q "^$package\$"; then
    echo "$package is already installed. Skipping..."
  else
    echo "Installing $package..."
    brew install "$package"
  fi
done

# Update and clean up again for safe measure
brew update
brew upgrade
brew cleanup
