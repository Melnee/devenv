return {
  "nvim-tree/nvim-tree.lua",
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
			-- prevent nvim-tree from being the last window so last window doesn't become nil if it's closed
			actions = {
				open_file = {
					quit_on_open = false,
				},
			},
			-- prevent nvim-tree from getting confused when focus shifts to it
			update_focused_file = {
				enable = true,
				update_root = false,
			},
			renderer = {
				icons = {
					show = {
						file = false,
						folder = false,
						folder_arrow = true,
						git = false,
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
