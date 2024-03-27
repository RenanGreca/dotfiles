# Install Homebrew
# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install brew packages according to the Brewfile
brew bundle install

# Install Oh My Zsh
# https://ohmyz.sh/
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Set global gitignore
git config --global core.excludesfile ~/.gitignore_global
