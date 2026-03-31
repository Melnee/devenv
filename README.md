# devenv

My personal, portable development environment using Docker, Neovim, and tmux. Clone this repo, build the image, and have a full dev setup on any Linux machine or remote server.

## Quick Start

```bash
docker compose run devenv
```

## Adding a Neovim Plugin

Plugins are managed by [lazy.nvim](https://github.com/folke/lazy.nvim) and are auto-discovered from the `nvim/.config/nvim/lua/plugins/` folder.

1. Create a new file in `nvim/.config/nvim/lua/plugins/`:

```
nvim/.config/nvim/lua/plugins/your-plugin.lua
```

2. Add the plugin spec:

```lua
return {
  "author/plugin-name"
}
```

For plugins that need configuration:

```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({
      -- your options here
    })
  end,
  keys = {
    { "<leader>x", "<cmd>SomeCommand<cr>" },
  },
}
```

3. Rebuild the Docker image:

```bash
docker compose build
```

4. Inside the container, open Neovim and lazy.nvim will automatically install the new plugin on startup.

---

## Adding a tmux Plugin

Plugins are managed by [TPM (Tmux Plugin Manager)](https://github.com/tmux-plugins/tpm), which is baked into the Docker image.

1. Add the plugin to `tmux/.tmux.conf`:

```bash
set -g @plugin 'author/plugin-name'
```

2. Rebuild the Docker image:

```bash
docker compose build
```

3. Inside the container, start tmux and press `prefix + I` (capital I) to install the plugin.

---

## Current Plugins

### Neovim
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — fuzzy finder
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) — file browser
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) — syntax highlighting
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) — seamless pane navigation

### tmux
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) — seamless pane navigation

---

## Navigation

`vim-tmux-navigator` lets you move between Neovim splits and tmux panes with the same keys — no prefix needed:

| Key | Direction |
|-----|-----------|
| `Ctrl-h` | left |
| `Ctrl-j` | down |
| `Ctrl-k` | up |
| `Ctrl-l` | right |

---

## Repo Structure

```
devenv/
  Dockerfile
  docker-compose.yml
  tmux/
    .tmux.conf
  nvim/
    .config/
      nvim/
        init.lua
        lua/
          plugins/
            telescope.lua
            treesitter.lua
            vim-tmux-navigator.lua
```
