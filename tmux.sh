#!/bin/bash

apt install tmux -y || yum install tmux -y || brew install tmux
tmux -V

mv ~/.tmux.conf ~/.tmux.conf.bkp.$(date +%V%m%d%H%M)
echo 'set -g default-terminal "screen-256color"' >> ~/.tmux.conf
