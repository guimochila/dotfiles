local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find fuzzy'})
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find git files'})
