local builtin = require('telescope.builtin')

require('telescope').setup({
	file_ignore_patterns = { "node%_modules/.*" }
})


vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find fuzzy' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find git files' })
