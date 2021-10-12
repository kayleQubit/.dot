#!/bin/bash

 [ -f ${HOME}/.tmux.conf ] && mv ${HOME}/.tmux.conf ${HOME}/.tmux.conf.bak
 cp ${HOME}/.dot/files/tmux.conf ${HOME}/.tmux.conf
 cp -r ${HOME}/.dot/files/tmux/ ${HOME}/.tmux/
