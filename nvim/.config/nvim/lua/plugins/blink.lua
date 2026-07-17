return {
  {
    "saghen/blink.cmp",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    version = "1.*",
    opts = {
      keymap = { 
        preset = "default",
        ["<C-y>"] = { "accept", "fallback" },
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {},
      },
      completion = {
        documentation = { auto_show = true },
        ghost_text = { enabled = true },
      },
    },
  },
}
