-- lukas-reineke/indent-blankline.nvim (ibl)
-- Indent guides. tab_char distinguishes tab indentation from space indentation.
return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = function()
    local hooks = require("ibl.hooks")
    -- Register in HIGHLIGHT_SETUP so colors survive colorscheme reloads
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#4b4b4b" })
    end)

    return {
      indent = {
        char = "│",        -- guide for space indentation
        tab_char = "→",    -- guide for tab indentation (visually distinct)
        highlight = "IblIndent",
      },
      scope = { enabled = false },  -- no treesitter scope underline
      exclude = {
        filetypes = {
          "help", "lazy", "mason", "TelescopePrompt", "dashboard",
        },
      },
    }
  end,
}
