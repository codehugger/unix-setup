# update everything
sudo apt update && sudo apt upgrade -y && sudo apt dist-upgrade -y && sudo apt autoremove -y

# install dev essentials
sudo apt install -y git zsh vim erlang elixir golang nodejs npm direnv python3-pip python3-venv build-essential inotify-tools rbenv

# install oh-my-zsh with plugins
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# rbenv
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build

# install lsd
wget https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb -O /tmp/lsd.deb
sudo dpkg -i /tmp/lsd.deb

# copy .dotfiles from github
mkdir -p ~/.config/direnv
wget https://raw.githubusercontent.com/codehugger/unix-setup/master/dotfiles/gitconfig -O ~/.gitconfig
wget https://raw.githubusercontent.com/codehugger/unix-setup/master/dotfiles/gitignore -O ~/.gitignore
wget https://raw.githubusercontent.com/codehugger/unix-setup/master/dotfiles/zshrc -O ~/.zshrc
wget https://raw.githubusercontent.com/codehugger/unix-setup/master/dotfiles/vimrc -O ~/.vimrc
wget https://raw.githubusercontent.com/codehugger/unix-setup/master/dotfiles/direnvrc -O ~/.config/direnv/direnvrc

# make sure latest shell environment is active
exec $SHELL

# run vim and install everything specified in .vimrc, including Coc
vim "+PlugInstall" "+GoInstallBinaries" "+CocInstall coc-go" "+CocInstall coc-python"

# install latest stable ruby
rbenv install 3.1.2
rbenv global 3.1.2
rbenv rehash

# install rails
gem install bundler
gem install rails
