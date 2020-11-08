#!/bin/bash

# Install Command-Line Tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install the essentials
brew install bat
brew install elixir
brew install go
brew install gotop
brew install graphviz
brew install http-server
brew install lsd
brew install neofetch
brew install node
brew install python
brew install rbenv
brew install tree
brew install vim

# Enable Homebrew Casks
brew install caskroom/cask

# Install applications and tools
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" dotnet
brew cask install --appdir="/Applications" expressvpn
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" microsoft-teams
brew cask install --appdir="/Applications" paw
brew cask install --appdir="/Applications" postgres
brew cask install --appdir="/Applications" postico
brew cask install --appdir="/Applications" rectangle
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" steam
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" zoomus

# Install fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-inconsolata
brew cask install font-roboto-mon
brew cask install font-input
brew cask install font-hack-nerd-font

# Set macOS defaults
# Disable annoying keyboard features
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false
defaults write -g ApplePressAndHoldEnabled -bool false

# Automatic dark/light mode
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

defaults write com.apple.finder CreateDesktop false
defaults write com.apple.dock mineffect -string scale
defaults write com.apple.dock tilesize -integer 48
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide -bool true
# to revert all dock settings: defaults delete com.apple.dock; killall Dock

killall Dock
killall Finder

# Install global NPM packages
npm install -g npm-check-updates
npm install -g jshint

# Configure Exercism
exercism configure -w ~/Projects/exercism

# Disable non-breaking space everywhere
mkdir -p ~/Library/KeyBindings
cp DefaultKeyBinding.dict ~/Library/KeyBindings/

# Copy custom themes
cp themes/codehugger.zsh-theme ~/.oh-my-zsh/custom/themes/codehugger.zsh-theme

# Install oh-my-zsh plugins
git clone https://github.com/marlonrichert/zsh-autocomplete.git ~/.oh-my-zsh/custom/plugins/zsh-autocomplete
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Symlink dotfiles
./makesymlinks.sh

# Make compaudit happy
for f in $(compaudit);do sudo chmod -R 755 $f;done;

# Support italics in terminal
tic -o ~/.terminfo dotfiles/xterm-256color.terminfo
