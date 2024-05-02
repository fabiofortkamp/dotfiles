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

# Set git flow configuration
$(brew --prefix)/bin/git flow config set --global master "main"
$(brew --prefix)/bin/git flow config set --global develop "develop"
$(brew --prefix)/bin/git flow config set --global feature "feature/"
$(brew --prefix)/bin/git flow config set --global hotfix "hotfix/"
$(brew --prefix)/bin/git flow config set --global bugfix "bugfix/"
$(brew --prefix)/bin/git flow config set --global release "release/"
$(brew --prefix)/bin/git flow config set --global support "support/"
$(brew --prefix)/bin/git flow config set --global versiontagprefix "v"

