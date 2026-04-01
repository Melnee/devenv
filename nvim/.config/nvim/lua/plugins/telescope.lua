return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("telescope").setup()
      require("telescope").load_extension("file_browser")
    end,
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files hidden=true<cr>" },
      { "<leader>fg", "<cmd>Telescope live_grep hidden=true<cr>" },
      { "<leader>fb", "<cmd>Telescope file_browser hidden=true<cr>" },
    },
  },
}
