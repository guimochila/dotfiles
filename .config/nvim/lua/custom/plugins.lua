local plugins = {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "html-lsp",
        "graphql-language-service-cli",
        "eslint-lsp",
        "css-lsp",
        "typescript-language-server",
        "prettier",
        "stylua"
      },
    },
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = {
      tools = {
        inlay_hints = {
          auto = true
        }
      }
    } 
  },
  {
    "mfussenegger/nvim-dap",
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml"},
    config = function(_, opts)
      local crates = require('crates')
      crates.setup(opts)
      crates.show()
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return
    end,
  },
  {
    "numToStr/Navigator.nvim",
    lazy = false,
    config = function()
      require('Navigator').setup()
    end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {"<leader>cx", ":TroubleToggle<CR>", desc = "Toggles Trouble"}
    }
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
      {"<leader>gs", ":Git<CR>", desc = "Fugitive/Git status"}
    }
  }
}

return plugins