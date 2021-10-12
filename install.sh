#!/bin/sh

print () {
  echo ""
  echo "<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>"
  echo "${1}"
  echo "<<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>><<>>"
  echo ""
}

if [ ! -f $HOME/.ssh/id_rsa ]; then
  print "Generating SSH key"
  ssh-keygen -t rsa -b 4096 -f "$HOME/.ssh/id_rsa"
fi

# Install core dev
print "Getting the core dev setup"

# Core setup for MacOS
print "MacOS core setup"
if [ "$(uname)" == "Darwin" ]; then

  # Brew
  if [ -z "$(type -fp brew)" ]; then
    print "Install Brew to get us started on Mac"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # ZSH, VIM and Tmux
  print "Install zsh, vim and tmux"

  brew install zsh
  brew install vim
  brew install tmux

  # Manual MacOS Font install
  # cd ~/Library/Fonts && { 
  #   curl -o RobotoMonoPowerline.ttf 'https://github.com/powerline/fonts/raw/master/RobotoMono/Roboto%20Mono%20for%20Powerline.ttf'
  #   cd -; }

# Core setup for Linux
print "Linux core setup"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Core setup for Linux
  sudo apt update
  sudo apt upgrade
  sudo apt install zsh
  sudo apt install vim-gtx
  sudo apt install tmux
fi

# Oh my ZSH
print "Oh my"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Fonts
print "Install fonts"
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts

/bin/bash ~/.dot/updateBash.sh
/bin/bash ~/.dot/updateVim.sh
/bin/bash ~/.dot/updateTmux.sh

# Install NVM
print "Javascript Five star dev"
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.35.3/install.sh | bash
source ~/.nvm/nvm.sh
nvm install 12
nvm install 8
nvm install node
nvm use 12

# Git setup
print "Let's get Git set up"

echo "What name should we use for Git?"
read gitname
echo "What email should we use for Git?"
read gitemail
git config --global user.name $gitname
git config --global user.email $gitemail

# Mac Apps
print "Install all the casks"
if [ "$(uname)" == "Darwin" ]; then
  brew install --cask rectangle
  brew install --cask karabiner-elements
  brew install --cask clipy

  brew install yarn --without-node
  brew install --cask google-chrome
  brew install --cask visual-studio-code
  brew install --cask docker
  brew install --cask google-cloud-sdk

  brew install --cask slack
fi

print "Setup complete, congratulations!"

if [[ $0 != -zsh ]]; then
  chsh -s /bin/zsh
fi
