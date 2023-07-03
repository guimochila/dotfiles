return {
  -- core utils
  {
    'nvim-lua/plenary.nvim',
    lazy = true
  },

  -- Color scheme
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    config = function()
      vim.cmd([[colorscheme monokai-pro]])

      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end
  },
  -- Utilities
  { 'theprimeagen/harpoon' },
  {
    'mbbill/undotree',
    keys = { { "<C-u>", ":UndotreeToggle<cr>", desc = "Toggle Undotree" } }
  },
  {
    'tpope/vim-fugitive',
    keys = { { "<leader>gs", ":Git<cr>", desc = "Vim Fugitive" } },
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
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    },
    {
      'windwp/nvim-ts-autotag', opts = { update_on_insert = true }
    },
    { 'prettier/vim-prettier', init = function() require('config.prettierrc') end },
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
      end
    }
  }
}
