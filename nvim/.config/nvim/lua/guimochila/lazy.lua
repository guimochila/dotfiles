-- Automatically install lazy.nvim when it is not yet installed
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

require('lazy').setup({
  { import = 'guimochila.plugins' },
  { import = 'guimochila.plugins.lsp' },
  { import = 'guimochila.plugins.rust' },
}, {
  install = {
    colorscheme = { "kanagawa" }
  },
  checker = {
    enabled = true,
    notify = false,
  },
  change_detection = {
    notify = false
  }
})
