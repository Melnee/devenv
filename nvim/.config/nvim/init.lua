-- map leader key to be space 
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.netrw_sort_sequence = [[[\/]$,*]]

-- editor options
vim.opt.splitbelow = true
vim.opt.splitright = true

-- tab options
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = false



-- treesitter workaround
vim.treesitter.start = function() end

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
