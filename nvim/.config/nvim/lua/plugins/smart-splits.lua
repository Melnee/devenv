return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup({
      default_amount = 3,
    })
    local smart_splits = require("smart-splits")
    vim.keymap.set("n", "<A-h>", smart_splits.resize_left)
    vim.keymap.set("n", "<A-j>", smart_splits.resize_down)
    vim.keymap.set("n", "<A-k>", smart_splits.resize_up)
    vim.keymap.set("n", "<A-l>", smart_splits.resize_right)
  end
}
