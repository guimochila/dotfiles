vim.opt.guicursor = {
  'i-ci:block-Cursor/lCursor-blinkwait1000-blinkon100-blinkoff100',
}

vim.opt.clipboard = 'unnamedplus'

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.foldenable = false
vim.opt.foldmethod = "indent"
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
--vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
vim.opt.scrolloff = 8
vim.opt.colorcolumn = "80"
vim.opt.textwidth = 80
vim.opt.termguicolors = true

vim.wo.signcolumn = "yes"

-- Format on save via LSP
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])

vim.filetype.add({ extension = { tmpl = "html" } })
vim.filetype.add({ extension = { mdx = "mdx" } })
