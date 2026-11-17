-- Error-message display.
-- Shows the current line's diagnostic (e.g. pyright error) on the command line
-- at the bottom of the screen when the cursor rests on it, and clears it when
-- the cursor moves away. Toggle on/off with <leader>dd.

-- updatetime controls the delay before CursorHold fires (how long you must rest)
vim.o.updatetime = 300
vim.g.diag_line_enabled = true

local diag_hl = {
  [vim.diagnostic.severity.ERROR] = "DiagnosticError",
  [vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
  [vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
  [vim.diagnostic.severity.HINT]  = "DiagnosticHint",
}

local function echo_line_diagnostic()
  if not vim.g.diag_line_enabled then return end
  local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diags = vim.diagnostic.get(0, { lnum = lnum })
  if #diags == 0 then
    vim.api.nvim_echo({ { "" } }, false, {})
    return
  end
  local d = diags[1]
  local src = d.source and (" [" .. d.source .. "]") or ""
  vim.api.nvim_echo({ { d.message:gsub("%s*\n%s*", " ") .. src, diag_hl[d.severity] } }, false, {})
end

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = echo_line_diagnostic,
})

-- clear the message as soon as the cursor leaves the line
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  pattern = "*",
  callback = function()
    if vim.g.diag_line_enabled then vim.api.nvim_echo({ { "" } }, false, {}) end
  end,
})

vim.keymap.set("n", "<leader>dd", function()
  vim.g.diag_line_enabled = not vim.g.diag_line_enabled
  vim.api.nvim_echo({ { "" } }, false, {})
  vim.notify("Line diagnostics: " .. (vim.g.diag_line_enabled and "on" or "off"))
end, { desc = "Toggle bottom-line diagnostic message" })
