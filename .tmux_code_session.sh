#!/bin/sh
SESSIONNAME=$(basename $(pwd))
#tmux -2 attach-session -t $SESSIONNAME
tmux rename-session $SESSIONNAME 
tmux rename-window 'code'
tmux split-window -v -p 20
tmux send-keys -t 0 'vim' C-m
tmux new-window
tmux select-window -t 1
tmux select-pane -t 0

