#!/bin/bash

 [ -f ${HOME}/.tmux.conf ] && mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf.bak
 cp ${HOME}/.quaren/files/tmux.conf ${HOME}/.tmux.conf
 cp -r ${HOME}/.quaren/files/tmux/ ${HOME}/.tmux/
