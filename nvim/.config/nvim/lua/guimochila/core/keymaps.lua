local keymap = vim.keymap

-- Remapping key
vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("x", "<leader>P", [["_dP]])
keymap.set("n", "<leader>y", [["+Y]])
-- Do not yank on x
keymap.set('n', 'x', '"_x')

-- Increment/Decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Source init file
keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')

-- Quicklist
-- I know, right? Bizarre mapping using Alt on MacOS
keymap.set('n', 'œ', ':copen<CR>')
keymap.set('n', '∆', ':cnext<CR>')
keymap.set('n', '˚', ':cprev<CR>')

-- Closing buffers
keymap.set('n', '<leader>cx', ':bd<CR>', { desc = "Close current buffer" })
keymap.set('n', '<leader>cX', ':bd!<CR>', { desc = "Close current buffer without saving" })
