#!/bin/bash

rm -rf "$HOME/.urxvt"
ln -sf "$DOTFILES/urxvt" "$HOME/.urxvt"

mkdir -p "$XDG_DATA_HOME"

rm -rf "$XDG_CONFIG_HOME/vimb"
ln -sf "$DOTFILES/vimb" "$XDG_CONFIG_HOME/vimb"

rm -rf "$XDG_CONFIG_HOME/wyebadblock"
ln -sf "$DOTFILES/wyebadblock" "$XDG_CONFIG_HOME/wyebadblock"

rm -rf "$XDG_CONFIG_HOME/Code/User/settings.json"
rm -rf "$XDG_CONFIG_HOME/Code/User/keybindings.json"
mkdir -p "$XDG_CONFIG_HOME/Code"
mkdir -p "$XDG_CONFIG_HOME/Code/User"
ln -sf "$DOTFILES/Code/settings.json" "$XDG_CONFIG_HOME/Code/User/settings.json"
ln -sf "$DOTFILES/Code/keybindings.json" "$XDG_CONFIG_HOME/Code/User/keybindings.json"

rm -rf "$HOME/.profile"
ln -sf "$DOTFILES/.profile" "$HOME/.profile"

mkdir -p "$XDG_CONFIG_HOME/nvim"
mkdir -p "$XDG_CONFIG_HOME/nvim/undo"
ln -sf "$DOTFILES/nvim/init.vim" "$XDG_CONFIG_HOME/nvim/init.vim"

rm -rf "$HOME/.Xresources"
ln -sf "$DOTFILES/X11/.Xresources" "$HOME/.Xresources"
rm -rf "$HOME/.startx"
ln -sf "$DOTFILES/X11/.startx" "$HOME/.startx"
rm -rf "$HOME/.xinitrc"
ln -sf "$DOTFILES/X11/.xinitrc" "$HOME/.xinitrc"
rm -rf "$HOME/.Xmodmap"
ln -sf "$DOTFILES/X11/.Xmodmap" "$HOME/.Xmodmap"

rm -rf "$XDG_CONFIG_HOME/i3"
ln -s "$DOTFILES/i3" "$XDG_CONFIG_HOME"

mkdir -p "$XDG_CONFIG_HOME/zsh"
ln -sf "$DOTFILES/zsh/.zshenv" "$HOME"
ln -sf "$DOTFILES/zsh/.zshrc" "$XDG_CONFIG_HOME/zsh"

ln -sf "$DOTFILES/zsh/aliases" "$XDG_CONFIG_HOME/zsh/aliases"
rm -rf "$XDG_CONFIG_HOME/zsh/external"
ln -sf "$DOTFILES/zsh/external" "$XDG_CONFIG_HOME/zsh"

rm -rf "$XDG_CONFIG_HOME/zathura"
ln -sf "$DOTFILES/zathura" "$XDG_CONFIG_HOME/zathura"

cp -rf "$DOTFILES/fonts" "$XDG_DATA_HOME"

mkdir -p "$XDG_CONFIG_HOME/dunst"
ln -sf "$DOTFILES/dunst/dunstrc" "$XDG_CONFIG_HOME/dunst/dunstrc"

rm -f "$HOME/.gitconfig"
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"

mkdir -p "$XDG_CONFIG_HOME/tmux"
ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux/tmux.conf"

# install neovim plugin manager
[ ! -f "$DOTFILES/nvim/autoload/plug.vim" ] \
    && curl -fLo "$DOTFILES/nvim/autoload/plug.vim" --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p "$XDG_CONFIG_HOME/nvim/autoload"
ln -sf "$DOTFILES/nvim/autoload/plug.vim" "$XDG_CONFIG_HOME/nvim/autoload/plug.vim"
# Install (or update) all the plugins
nvim --noplugin +PlugUpdate +qa


[ ! -d "$XDG_CONFIG_HOME/tmux/plugins/tpm" ] \
&& git clone https://github.com/tmux-plugins/tpm \
"$XDG_CONFIG_HOME/tmux/plugins/tpm"

mkdir -p "$HOME/.mozilla/firefox/37a0vnc6.default-release/chrome"
ln -sf "$DOTFILES/firefox/userChrome.css" "$HOME/.mozilla/firefox/37a0vnc6.default-release/chrome/userChrome.css"
