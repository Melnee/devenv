#!/bin/bash
set -euo pipefail

# install dependencies
brew install neovim tmux git stow ripgrep fd curl unzip

# install TPM
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# no fd symlink needed on mac, brew installs it as 'fd' directly
stow -t "$HOME" tmux
stow -t "$HOME" nvim

echo "done! open a new terminal and run tmux, then prefix + I to install plugins"
echo "remember to set JetBrainsMono Nerd Font in your terminal emulator settings!"
