return function(use)
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end
  })

  use('thePrimeagen/harpoon')
  use('christoomey/vim-tmux-navigator')

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  })

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
