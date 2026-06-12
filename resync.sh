#!/bin/bash
# remove broken symlinks in nvim plugins folder
find ~/.config/nvim -xtype l -delete

stow -t "$HOME" nvim --restow
stow -t "$HOME" tmux --restow
tmux source-file ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins
nvim --headless "+Lazy! clean" +qa
nvim --headless "+Lazy! sync" +qa
