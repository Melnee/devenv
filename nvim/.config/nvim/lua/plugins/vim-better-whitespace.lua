-- ntpeters/vim-better-whitespace: trailing + indent whitespace visibility
return {
  "ntpeters/vim-better-whitespace",
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    vim.g.better_whitespace_enabled = 1
    vim.g.strip_whitespace_on_save = 0
    vim.g.strip_whitespace_confirm = 0
    vim.g.strip_whitelines_at_eof = 1
    vim.g.show_spaces_that_precede_tabs = 1
    vim.g.better_whitespace_skip_empty_lines = 0
    vim.g.better_whitespace_filetypes_blacklist = {
      "diff", "git", "gitcommit", "unite", "qf", "help",
      "markdown", "fugitive", "lazy", "mason", "TelescopePrompt",
    }
  end,
  keys = {
    { "<leader>ws", "<cmd>StripWhitespace<cr>",  desc = "Strip trailing whitespace" },
    { "<leader>wt", "<cmd>ToggleWhitespace<cr>", desc = "Toggle whitespace highlight" },
  },
}
