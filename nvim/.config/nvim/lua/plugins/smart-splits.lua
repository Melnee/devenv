return {
  "mrjones2014/smart-splits.nvim",
  -- Pinned to v2.1.1-final: the last release that bundles the built-in tmux
  -- integration (sets the @pane-is-vim tmux var so C-h/j/k/l cross between
  -- nvim splits and tmux panes). v3 moved tmux support to a separate backend
  -- plugin; without it, pane navigation into nvim silently breaks.
  -- `commit` alone pins to this exact commit AND self-corrects a plugin that
  -- was previously installed at a different version. Do NOT add `pin = true`:
  -- it keeps whatever is *currently* checked out, so a remote already on v3
  -- would never move to this commit.
  commit = "ac11b8ed1efe7cca7bb3eae9c588163c926c6894",
  config = function()
    require("smart-splits").setup({
      default_amount = 3,
    })
    local smart_splits = require("smart-splits")
    vim.keymap.set("n", "<C-h>", smart_splits.move_cursor_left)
    vim.keymap.set("n", "<C-j>", smart_splits.move_cursor_down)
    vim.keymap.set("n", "<C-k>", smart_splits.move_cursor_up)
    vim.keymap.set("n", "<C-l>", smart_splits.move_cursor_right)
    vim.keymap.set("n", "<A-h>", smart_splits.resize_left)
    vim.keymap.set("n", "<A-j>", smart_splits.resize_down)
    vim.keymap.set("n", "<A-k>", smart_splits.resize_up)
    vim.keymap.set("n", "<A-l>", smart_splits.resize_right)
  end
}
