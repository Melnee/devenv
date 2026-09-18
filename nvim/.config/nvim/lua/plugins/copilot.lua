return {
  {
    "zbirenbaum/copilot.lua",
    enabled = vim.fn.filereadable(vim.fn.expand("~/.copilot_enabled")) == 1,
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
}
