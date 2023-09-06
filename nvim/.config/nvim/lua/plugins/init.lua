return {
  -- core utils
  {
    'nvim-lua/plenary.nvim',
    lazy = true
  },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = function()
      return require 'plugins.configs.treesitter'
    end,
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end
  },

  -- LSP stuffs
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' }, -- Required
      {                            -- Optional
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      {
        'hrsh7th/nvim-cmp',
        lazy = false,
        --event = "InsertEnter",
        config = function()
          require "plugins.configs.cmp"
        end,
        dependencies = {
          {
            'L3MON4D3/LuaSnip',
            dependencies = { "rafamadriz/friendly-snippets" },
            build = "make install_jsregexp",
            opts = { history = true, updateevents = "TextChanged,TextChangedI" },
            config = function(_, opts)
              require("plugins.configs.luasnippets").luasnip(opts)
            end,
          },
          {
            "windwp/nvim-autopairs",
            opts = {
              fast_wrap = {},
              disable_filetype = { "TelescopePrompt", "vim" },
            },
            config = function(_, opts)
              require("nvim-autopairs").setup(opts)
              -- setup cmp for autopairs
              local cmp_autopairs = require "nvim-autopairs.completion.cmp"
              require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end,
          },
        },
      },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lua" },
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
    },
    config = function() require "plugins.configs.lsp" end
  },


  -- Color scheme
  -- {
  --   "loctvl842/monokai-pro.nvim",
  --   lazy = false,
  --   config = function()
  --     vim.cmd([[colorscheme monokai-pro]])
  --
  --     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
  --   end
  -- },
  {
    "oxfist/night-owl.nvim",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd.colorscheme("night-owl")

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
      vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg = 0, bg = "#092135" })
      vim.api.nvim_set_hl(0, "MatchParen", { bg = "#00a884" })
      vim.api.nvim_set_hl(0, "VisualActive", { bg = "#1d3b88" })
    end,
  },
  -- Utilities
  { 'theprimeagen/harpoon' },
  {
    'mbbill/undotree',
    keys = { { "<C-u>", ":UndotreeToggle<cr>", desc = "Toggle Undotree" } }
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lz", ":LazyGit<cr>", desc = "Lazygit plugin" }
    }
  },
  {
    "numToStr/Navigator.nvim",
    lazy = false,
    config = function()
      require('Navigator').setup()
    end,
    keys = {
      { "<C-h>",     ":NavigatorLeft <CR>",       desc = "Tmux navigate Left" },
      { "<C-j>",     ":NavigatorDown <CR>",       desc = "Tmux navigate Down" },
      { "<C-k>",     ":NavigatorUp <CR>",         desc = "Tmux navigate Up" },
      { "<C-l>",     ":NavigatorRight <CR>",      desc = "Tmux navigate Right" },
      { "<C-\\>",    ":NavigatorLastActive <CR>", desc = "Tmux navigate Last Active" },
      { "<C-Space>", ":NavigatorNext <CR>",       desc = "Tmux navigate Next" }
    }
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeout = 300
      require("which-key").setup({})
    end
  },
  {
    'windwp/nvim-ts-autotag', opts = { update_on_insert = true }
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    init = function()
      require('lualine').setup({ options = { theme = 'material' } })
    end
  },
  {
    'norcalli/nvim-colorizer.lua',
    init = function()
      require('colorizer').setup()
    end
  },
  {
    "lewis6991/gitsigns.nvim",
    init = function()
      require('gitsigns').setup()
    end,
    keys = {
      { "<leader>tb", ":Gitsigns blame_line<CR>", desc = "Git line blame" }
    }
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    'simrat39/rust-tools.nvim',
    opts = {
      inlay_hints = { auto = true }
    }
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  },
  {
    'junegunn/vim-easy-align',
    lazy = true,
    keys = {
      { 'ga', '<Plug>(EasyAlign)', mode = "x" },
      { 'ga', '<Plug>(EasyAlign)' },
    }
  },
  {
    'RRethy/vim-illuminate',
    config = function()
      vim.cmd([[hi IlluminatedWordRead guibg=#525252]])
    end
  },
  {
    'adnan007d/vim-prettier'
  }
}
