#!/bin/sh
SESSIONNAME=$(basename $(pwd))
tmux new-session -d -s $SESSIONNAME 'exec vim'
tmux rename-window 'code'
tmux split-window -v -p 20
tmux new-window
tmux select-window -t 1
tmux select-pane -t 0
tmux -2 attach-session -t $SESSIONNAME

