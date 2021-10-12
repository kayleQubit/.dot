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

print "Getting the core dev setup"
# Install core dev
if [ "$(uname)" == "Darwin" ]; then
  if [ -z "$(type -fp brew)" ]; then
    print "Install Brew to get us started on Mac"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  print "Install zsh, vim and tmux"

  brew install zsh
  brew install vim
  brew install tmux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

    # Do something under GNU/Linux platform

fi

/bin/bash ~/.dot/updateBash.sh
/bin/bash ~/.dot/updateVim.sh
/bin/bash ~/.dot/updateTmux.sh

