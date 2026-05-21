return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    require("vscode").setup({ transparent = true })
    require("vscode").load()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#4A1A4A", fg = "white" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1e1e1e", fg = "gray" })
      end,
    })
  end,
}
