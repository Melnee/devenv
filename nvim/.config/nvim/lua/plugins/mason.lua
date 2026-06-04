return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "eslint", "ts_ls"},
        automatic_installation = true,
      })
      vim.lsp.enable("pyright")
      vim.lsp.enable("ruby-lsp")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("eslint")
    end,
  },
}
