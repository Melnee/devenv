return {
  "Mofiqul/vscode.nvim",
  priority = 1000,
  config = function()
    require("vscode").setup({ 
      transparent = false, 
      color_overrides = {
        vscBack = "#1e1e2e"
      }
    })
    require("vscode").load()
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        vim.api.nvim_set_hl(0, "StatusLine", { bg = "#4A1A4A", fg = "white" })
        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1e1e1e", fg = "gray" })
        -- rainbow delimiters
        vim.api.nvim_set_hl(0, "RainbowDelimiterRed",    { fg = "#ff6b6b" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#ffd93d" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow",   { fg = "#6bcbff" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen", { fg = "#ff9f43" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",  { fg = "#6bff8e" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#c56bff" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan",   { fg = "#6bffee" })
        end,
    })
  end,
}
