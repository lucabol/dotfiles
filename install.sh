#!/bin/bash

mkdir -p "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim/undo"
ln -sf "$HOME/dotfiles/nvim/init.vim" "$HOME/.config/nvim/init.vim"

ln -sf "$HOME/dotfiles/X11/.Xdefaults" "$HOME/.Xdefaults"
