#!/bin/bash

# [ -f ${HOME}/.tmux.conf ] && mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf.bak
# cp ${HOME}/.dot/files/tmux.conf ${HOME}/.tmux.conf
# cp -r ${HOME}/.dot/files/tmux/ ${HOME}/.tmux/

cd ${HOME}
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
