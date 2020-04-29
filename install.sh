#!/bin/bash

# Install Command-Line Tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Enable Homebrew Casks
brew install brew-cask
brew install caskroom/cask

# Install essential libraries
brew install graphviz

# Install languages
brew install node
brew install rbenv
brew install python
brew install go
brew install elixir

# Install editors and tools
brew install vim
brew install bat
brew install tree
brew install exercism
brew install http-server

# Install applications
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" expressvpn
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" firefox-developer-edition
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" postgres
brew cask install --appdir="/Applications" postico
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" vlc

# Install fonts
brew cask install font-fira-code

# Disable non-breaking space everywhere
mkdir ~/Library/KeyBindings
cp DefaultKeyBinding.dict ~/Library/KeyBindings/

# Set macOS features
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false
defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false
defaults write -g AppleFontSmoothing -int 2
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true
defaults write com.apple.finder CreateDesktop false

# Symlink dotfiles
./dotfiles/makesymlinks.sh
