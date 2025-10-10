#!/usr/bin/env bash

# Directories
Notes='/home/mbuci/repos/notes/'
Flutter='/home/mbuci/repos/SubversesFlutterMVP/subverses_flutter/'
Nvim='/home/mbuci/.config/nvim'

# Start a new tmux session named "dev"
tmux new-session -d -s dev -n "Notes" "zsh -c \"cd ~/repos/notes/; nvim $Notes; exec zsh\""

tmux new-window -t dev:1 -n "Flutter" "zsh -c \"cd ~/repos/SubversesFlutterMVP/subverses_flutter; nvim $Flutter; exec zsh\""

tmux new-window -t dev:2 -n "Nvim Config" "zsh -c \"cd ~/.config/nvim; nvim $Nvim; exec zsh\""

tmux new-window -t dev:3 "zsh"

# To get the window names correct
tmux source ~/.tmux.conf

# Attach to the session
tmux attach -t dev
