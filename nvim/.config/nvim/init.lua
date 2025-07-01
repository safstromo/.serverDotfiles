local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Support for remote clipboard ssh
vim.g.clipboard = {
  name = 'OSC 52',
  copy = {
    ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
    ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
  },
  paste = {
    ['+'] = function() return { vim.fn.split(vim.fn.getreg(''), '\\n'), vim.fn.getregtype('') } end,
    ['*'] = function() return { vim.fn.split(vim.fn.getreg('*'), '\\n'), vim.fn.getregtype('*') } end,
  },
}

vim.opt.clipboard:append { 'unnamed', 'unnamedplus' }
require("config")
require("lazy").setup("plugins")
