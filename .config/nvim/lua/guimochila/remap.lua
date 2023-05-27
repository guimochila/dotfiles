vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

--Moving lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", ":<ESC>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", ":<ESC>:m .-2<CR>==gi")

-- Fugitive remap
vim.keymap.set("n", "<leader>gb", ":silent G blame<CR>", { silent = true })
