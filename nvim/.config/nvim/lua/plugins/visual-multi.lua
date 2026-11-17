return {
  "mg979/vim-visual-multi",
  branch = "master",
  init = function()
    -- VSCode Ctrl+D style multicursor: cursor on a word, <C-d> selects it and
    -- each press after adds the next occurrence as a live cursor. Edit all at
    -- once, <Esc> exits. Config must be set before the plugin loads, hence init.
    -- Note: this overrides <C-d> half-page scroll in normal mode.
    vim.g.VM_maps = {
      ["Find Under"] = "<C-d>",         -- normal mode: select word under cursor
      ["Find Subword Under"] = "<C-d>", -- visual mode: select current selection
    }
  end
}
