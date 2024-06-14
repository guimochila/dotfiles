return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>pf', ':Telescope find_files hidden=true<cr>',        desc = 'Search Files' },
    { '<C-p>',      ':Telescope git_files<cr>',                     desc = 'Search git files' },
    { '<leader>fg', ':Telescope live_grep<cr>',                     desc = 'Grep search' },
    { '<leader>fs', ':Telescope lsp_dynamic_workspace_symbols<cr>', desc = 'Search symbols' }
  }
}
