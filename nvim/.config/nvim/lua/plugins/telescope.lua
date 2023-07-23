return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { '<leader>pf', ':Telescope find_files hidden=true<cr>', desc = 'Search Files' },
    { '<C-p>',      ':Telescope git_files<cr>',              desc = 'Search git files' },
    { '<leader>fg', ':Telescope live_grep<cr>',              desc = 'Grep search' },
  }
}
