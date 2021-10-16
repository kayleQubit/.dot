#!/bin/bash

# [ -f ${HOME}/.tmux.conf ] && mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf.bak
# cp ${HOME}/.dot/files/tmux.conf ${HOME}/.tmux.conf
# cp -r ${HOME}/.dot/files/tmux/ ${HOME}/.tmux/

git clone https://github.com/gpakosz/.tmux.git ${HOME}/.tmux
ln -s -f ${HOME}/.tmux/.tmux.conf ${HOME}/.tmux.conf
cp ${HOME}/.dot/files/tmux.conf.local ${HOME}/.tmux.conf.local
