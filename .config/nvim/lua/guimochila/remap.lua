vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

-- Fugitive remap
vim.keymap.set("n", "<leader>gb", ":silent G blame<CR>", { silent = true })
