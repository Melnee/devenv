return {
  "nvim-tree/nvim-tree.lua",
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
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
