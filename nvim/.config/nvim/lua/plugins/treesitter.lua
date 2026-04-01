return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
		build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "ruby",
          "javascript",
          "typescript",
          "tsx",
          "jsx",
          "html",
          "css",
          "yaml",
          "dockerfile",
          "json",
          "lua",
          "bash",
          "python",
        },
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
  },
}
