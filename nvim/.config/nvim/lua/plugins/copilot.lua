return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { 
          enabled = true,
          keymap = {
            accept = "<C-y>",
            dismiss = "<C-e>",
          },
        },
        panel = { enabled = false },
      })
    end,
  },
}
