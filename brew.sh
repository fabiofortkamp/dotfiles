#!/usr/bin/env zsh
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

    if [-x "/home/linuxbrew/.linuxbrew/bin/brew"]; then

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
    "bash"
    "zsh"
    "git"
    "tree"
    "bat"
    "coreutils"
    "tmux"
    "libyaml"
    "gh"
    "fd"
    "php"
    "fzf"
    "git-flow-avh"
    "zoxide"
    "tree"
    "gojq"
    "openssl"
    "cmake"
    "luarocks"
    "ripgrep"
    "fd"
    "pipx"
    "python-launcher"
    "direnv"
    "stow"
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

# Add the Homebrew zsh to allowed shells
echo "Changing default shell to Homebrew zsh"
echo "$(brew --prefix)/bin/zsh" | sudo tee -a /etc/shells >/dev/null
# Set the Homebrew zsh as default shell
chsh -s "$(brew --prefix)/bin/zsh"

# Git config name
echo "Please enter your FULL NAME for Git configuration:"
read git_user_name

# Git config email
echo "Please enter your EMAIL for Git configuration:"
read git_user_email

# Set my git credentials
$(brew --prefix)/bin/git config --global user.name "$git_user_name"
$(brew --prefix)/bin/git config --global user.email "$git_user_email"

# Update and clean up again for safe measure
brew update
brew upgrade
brew cleanup

