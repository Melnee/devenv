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
        vim.api.nvim_set_hl(0, "RainbowDelimiterRed",    { fg = "#cc6666" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterOrange", { fg = "#cc8855" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterYellow", { fg = "#ccbb55" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterGreen",  { fg = "#66bb77" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterBlue",   { fg = "#66aacc" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterViolet", { fg = "#aa66cc" })
        vim.api.nvim_set_hl(0, "RainbowDelimiterCyan",   { fg = "#66bbbb" })
      end,
    })
  end,
}
