return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      filters = {
        dotfiles = false,
        git_ignored = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      renderer = {
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            folder = {
              arrow_closed = "▶",
              arrow_open = "▼",
            },
          },
        },
      },
    })
    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>")
  end
}
