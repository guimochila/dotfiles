return function(use)
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  })

  use('thePrimeagen/harpoon')
  use('christoomey/vim-tmux-navigator')

  -- Colorschemes

  -- LSP
  use('jose-elias-alvarez/null-ls.nvim')

  -- Better coding
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  })

end
