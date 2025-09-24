#!/bin/bash

# Directories
Notes='/home/mbuci/Documents/Repos/notes/Project\ Notes/TODO.md'
Flutter='/home/mbuci/Documents/Repos/SubversesFlutterMVP/subverses_flutter/'
#=~/projects/dir3

# Start a new tmux session named "dev"
tmux new-session -d -s dev -n "Notes" "zsh -c \"nvim $Notes; exec zsh\""

tmux new-window -t dev:1 -n "Flutter" "zsh -c \"nvim $Flutter; exec zsh\""

tmux new-window -t dev:2 "zsh"

# Attach to the session
tmux attach -t dev
