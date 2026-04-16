return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
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
      })
      vim.treesitter.language.register("javascript", "javascriptreact")
      vim.treesitter.language.register("typescript", "typescriptreact")
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
          pcall(vim.treesitter.start)
        end,
      })
      vim.opt.indentexpr = "nvim_treesitter#indent()"
    end,
  },
}
