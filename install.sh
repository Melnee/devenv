#!/bin/bash

set -euo pipefail

# install dependencies
sudo apt update && sudo apt install -y neovim tmux git stow ripgrep fd-find curl

# install TPM
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# symlink fd
mkdir -p "$HOME/.local/bin"
ln -sf "$(which fdfind)" "$HOME/.local/bin/fd"

# stow configs
stow -t "$HOME" tmux
stow -t "$HOME" nvim

echo "done! open a new terminal and run tmux, then prefix + I to install plugins"
