#!/bin/bash

git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
ln -s -f ${HOME}/.tmux/.tmux.conf ${HOME}/.tmux.conf
cp ${HOME}/.dot/files/tmux.conf.local ${HOME}/.tmux.conf.local
