-- map leader key to be space 
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- editor options
vim.opt.splitright = true
-- tab options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- line numbres
vim.opt.number = true

--colors thingy to help with themes showing up at all
vim.opt.termguicolors = true

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

vim.cmd.colorscheme("vscode")

vim.api.nvim_set_hl(0, 'NormalNC', { bg = '#1e1e24' })  -- inactive, slightly shifted

-- characters for trailing whitespace and non breaking space
vim.opt.list = true
vim.opt.listchars = { trail = "·", nbsp = "␣" }

-- case insensitive unless you deliberately type in uppercase
vim.opt.ignorecase = true

vim.keymap.set("n", "<leader>vi", function()
  local file = vim.fn.expand("%:p")
  if file == "" or vim.bo.buftype ~= "" then
    vim.notify("No file open", vim.log.levels.WARN)
    return
  end
  vim.fn.jobstart({"firefox", file})
end)

