#!/bin/bash
set -euo pipefail
# install dependencies
sudo dnf install -y tmux git stow ripgrep fd-find curl unzip nodejs npm

curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz -C /tmp
sudo mv /tmp/nvim-linux-x86_64 /opt/nvim

sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim

rm nvim-linux-x86_64.tar.gz


npm install -g tree-sitter-cli
# install TPM
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
# symlink fd
stow -t "$HOME" tmux
stow -t "$HOME" nvim
echo "done! open a new terminal and run tmux, then prefix + I to install plugins"
echo "remember to set JetBrainsMono Nerd Font in your terminal emulator settings!"
