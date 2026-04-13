#!/bin/bash

stow -t "$HOME" nvim
stow -t "$HOME" tmux

tmux source-file ~/.tmux.conf

~/.tmux/plugins/tpm/bin/install_plugins
