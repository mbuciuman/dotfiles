#!/usr/bin/env bash

# Directories
Notes='/home/mbuci/Documents/Repos/notes/'
Flutter='/home/mbuci/Documents/Repos/SubversesFlutterMVP/subverses_flutter/'
Nvim='/home/mbuci/.config/nvim'

# Start a new tmux session named "dev"
tmux new-session -d -s dev -n "Notes" "zsh -c \"cd ~/Documents/Repos/notes/; nvim $Notes; exec zsh\""

tmux new-window -t dev:1 -n "Flutter" "zsh -c \"cd ~/Documents/Repos/SubversesFlutterMVP; nvim $Flutter; exec zsh\""

tmux new-window -t dev:2 -n "Nvim Config" "zsh -c \"cd ~/.config/nvim; nvim $Nvim; exec zsh\""

tmux new-window -t dev:3 "zsh"

# Attach to the session
tmux attach -t dev
