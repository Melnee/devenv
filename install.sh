#!/bin/bash

set -euo pipefail

# install dependencies
sudo apt update && sudo apt install -y  tmux git stow ripgrep fd-find curl unzip nodejs npm python3-pip 

if [ ! -f /usr/local/bin/nvim ]; then 
 curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
 tar xzf nvim-linux-x86_64.tar.gz
 sudo mv nvim-linux-x86_64 /opt/nvim
 sudo ln -s /opt/nvim/bin/nvim /usr/local/bin/nvim
 rm nvim-linux-x86_64.tar.gz
fi

npm install -g tree-sitter-cli

pip3 install libtmux --break-system-packages

# install TPM
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# symlink fd
mkdir -p "$HOME/.local/bin"
ln -sf "$(which fdfind)" "$HOME/.local/bin/fd"


stow -t "$HOME" tmux
stow -t "$HOME" nvim

echo "done! open a new terminal and run tmux, then prefix + I to install plugins"

echo "remember to set JetBrainsMono Nerd Font in your terminal emulator settings!"


