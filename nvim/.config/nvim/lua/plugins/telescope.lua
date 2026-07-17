return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { "%.git/" },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--ignore-case",
            "--hidden",
            "--no-ignore",
            "--glob=!.git/*",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            no_ignore = true,
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>" },
      { "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>" },
      { "<leader>fb", "<cmd>Telescope file_browser hidden=true<cr>" },
    },
  },
}
