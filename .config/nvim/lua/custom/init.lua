vim.opt.colorcolumn = "80"
vim.opt.number = true
vim.opt.relativenumber = true

vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]

