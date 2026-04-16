# devenv

Portable tmux and Neovim dotfiles managed with GNU Stow.

# Copilot integration
:Copilot auth, and then follow instructions

ctrl-y to accept copilot suggestion
ctrl-e to dismiss copilot suggestion

## Install

From the repo root:

```bash
chmod +x install.sh
./install.sh
```

What `install.sh` does:

- installs required packages with `apt`
- clones [TPM](https://github.com/tmux-plugins/tpm) into `~/.tmux/plugins/tpm` if it is not already there
- creates `~/.local/bin/fd` as a symlink to `fdfind`
- stows `tmux/` into `$HOME`
- stows `nvim/` into `$HOME`

## Expected Paths

After install, these paths should point into this repo:

- `~/.tmux.conf`
- `~/.config/nvim/init.lua`
- `~/.config/nvim/lazy-lock.json`
- `~/.config/nvim/lua/plugins/...`

## Neovim

Start Neovim within tmux once after install:


```bash
tmux
nvim
```

That lets your Neovim plugin manager sync or install plugins if needed.

## Shortcut Reference

This repo sets `Space` as the Neovim leader key and installs:

- `christoomey/vim-tmux-navigator`
- `nvim-telescope/telescope.nvim`
- `nvim-telescope/telescope-file-browser.nvim`
- `mrjones2014/smart-splits.nvim`

### File Search and Browsing

Telescope mappings configured in this repo:

- `Space ff` for fuzzy file search
- `Space fg` for live grep
- `Space fb` for the Telescope file browser

Inside the Telescope file picker:

- `Ctrl-x` opens the selected file in a horizontal split
- `Ctrl-v` opens the selected file in a vertical split
- `Ctrl-t` opens the selected file in a new tab

Built-in netrw file explorer commands:

- `:Explore` opens netrw
- `:Vex` opens netrw in a vertical split
- `:Sex` opens netrw in a horizontal split
- `o` opens the highlighted file in a horizontal split
- `v` opens the highlighted file in a vertical split
- `t` opens the highlighted file in a new tab
- `p` opens the highlighted file in the previous window

### Split and Pane Navigation

With `vim-tmux-navigator`, these work without the tmux prefix and move between both Neovim splits and tmux panes:

- `Ctrl-h` moves left
- `Ctrl-j` moves down
- `Ctrl-k` moves up
- `Ctrl-l` moves right

Neovim split commands that still work inside Neovim:

- `Ctrl-w c` closes the current split
- `Ctrl-w o` closes all other splits
- `Ctrl-w h` moves to the split on the left
- `Ctrl-w j` moves to the split below
- `Ctrl-w k` moves to the split above
- `Ctrl-w l` moves to the split on the right

Resize splits:

- `Alt+hjkl` grows or shrinks width in any direction, for both tmux and nvim

### Editing and Selection

- `u` undo
- `U` undo all changes on the current line
- `Ctrl-r` redo
- `o` opens a new line below and enters insert mode
- `O` opens a new line above and enters insert mode
- `ggVG` selects the whole file
- `"+y` copies to the system clipboard
- `ggVG"+y` copies the whole file to the system clipboard
- `"+p` pastes from the system clipboard
- `Ctrl-r` then `+` pastes from the clipboard in insert mode

Quote editing:

- `ci"` changes inside double quotes
- `di"` deletes inside double quotes
- `yi"` yanks inside double quotes
- `vi"` visually selects inside double quotes

The same pattern works for single quotes and backticks.

### Navigation Inside a File

- `w`, `W`, `3w` move forward by words
- `b`, `B`, `2b` move backward by words
- `e`, `E` move to the end of a word
- `0` moves to the start of the line
- `^` moves to the first non-space character
- `$` moves to the end of the line
- `gg` moves to the top of the file
- `G` moves to the bottom of the file
- `42G` or `:42` jumps to line 42
- `Ctrl-d` half-page down
- `Ctrl-u` half-page up
- `Ctrl-f` full-page down
- `Ctrl-b` full-page up
- `H`, `M`, `L` move to the top, middle, or bottom of the screen
- `{` moves to the previous paragraph
- `}` moves to the next paragraph
- `zz` centers the current line
- `zt` puts the current line at the top
- `zb` puts the current line at the bottom

### Search and Replace

- `/word` searches forward in the current file
- `?word` searches backward in the current file
- `n` jumps to the next match
- `N` jumps to the previous match
- `*` searches for the word under the cursor
- `:%s/old/new/g` replaces all matches in the current file
- `:noh` or `:nohlsearch` clears search highlighting

Project-wide replace:

```vim
:args **/*.js
:argdo %s/foo/bar/g | update
```

Useful checks:

- `:args` shows the current argument list before running `:argdo`

### File Creation and Buffer Management

- `:e newfile.txt` creates or opens a file
- `:w newfile.txt` saves the current buffer to a file
- `:enew` creates a new empty buffer
- `:saveas newname.txt` renames the current file by saving to a new name and switching to it
- `:bd #` closes the alternate buffer
- `:!rm %` deletes the current file from disk
- `:!rm % | bd` deletes the current file and closes its buffer

### Tabs

- `gt` moves to the next tab
- `gT` moves to the previous tab
- `:tabn` moves to the next tab
- `:tabp` moves to the previous tab
- `:tab split` opens the current file in a new tab
- `:tabclose` closes the current tab
- `:tabmove +1` moves the current tab forward
- `:tabmove -1` moves the current tab backward
- `:tabmove 0` moves the current tab to the first position
- `:tabmove 3` moves the current tab to position 4

### Terminal

- `:belowright split | terminal` opens a terminal in a bottom split
- `:term` opens a terminal in the current window
- `:tab terminal` opens a terminal in a new tab
- `:resize 15` resizes the terminal split
- `i` enters terminal input mode
- `Ctrl-\ Ctrl-n` leaves terminal mode
- `Ctrl-w k` moves from the terminal to the split above
- `Ctrl-w j` moves from code down to the terminal split

### Plugin and Git Utilities

- `:checkhealth nvim-treesitter` checks the treesitter plugin health
- `git blame -L 365,365 path/to/file` shows blame for a specific line

### tmux Basics

Window management with the default tmux prefix (`Ctrl-b`):

- `Ctrl-b c` creates a new window
- `Ctrl-b n` moves to the next window
- `Ctrl-b p` moves to the previous window
- `Ctrl-b w` lists windows
- `Ctrl-b 0` through `Ctrl-b 9` jumps to a numbered window
- `Ctrl-b ,` renames the current window

Pane management:

- `Ctrl-b "` splits horizontally
- `Ctrl-b %` splits vertically
- `tmux select-pane -T mypane` renames a pane
- `tmux rename-window mynewname` renames a window

tmux copy mode:

- `Ctrl-b [` enters copy mode
- move to the start of the text, press `Space`, select text, then press `Enter`
- `Ctrl-b ]` pastes

## tmux

Start tmux:

```bash
tmux
```

Then install tmux plugins with:

- `Ctrl-b`, then `Shift+i`

That is the same as `prefix + I` with the default tmux prefix.

## tmux Troubleshooting

If `Ctrl-b` followed by `Shift+i` does nothing, the most common issue is that the running tmux server has not reloaded the current config yet.

Inside tmux, reload the config:

```tmux
source-file ~/.tmux.conf
```

You can run that with:

- `Ctrl-b`, then `:`
- enter `source-file ~/.tmux.conf`
- press Enter

Then try `Ctrl-b` followed by `Shift+i` again.

If it still does not work, restart the tmux server completely:

```bash
tmux kill-server
tmux
```

Then try `Ctrl-b` followed by `Shift+i` again.

## Stow Conflicts

If `stow` fails, it usually means real files already exist where symlinks need to be created.

Example conflict locations:

- `~/.tmux.conf`
- `~/.config/nvim/init.lua`
- `~/.config/nvim/lazy-lock.json`
- `~/.config/nvim/lua/plugins/...`

Move or back up those files first, then run `./install.sh` again.


