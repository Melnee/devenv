#!/bin/bash
set -euo pipefail

# install dependencies
brew install neovim tmux git stow ripgrep fd curl unzip tree-sitter-cli node

grep -qxF 'export PATH="$(brew --prefix tree-sitter)/bin:$PATH"' "$HOME/.zshrc" \
  || echo 'export PATH="$(brew --prefix tree-sitter)/bin:$PATH"' >> "$HOME/.zshrc"


# install TPM
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi

# no fd symlink needed on mac, brew installs it as 'fd' directly
stow -t "$HOME" tmux
stow -t "$HOME" nvim

echo "done! open a new terminal and run tmux, then prefix + I to install plugins"
echo "and if there are updates to the tmux plugins, then prefix + I to update"

echo "remember to set JetBrainsMono Nerd Font in your terminal emulator settings!"
