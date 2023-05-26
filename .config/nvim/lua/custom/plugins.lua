return function(use)
  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({})
    end,
  })

  use({
    "thePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({ tabline = true })
    end,
  })
  use("christoomey/vim-tmux-navigator")
  use("simrat39/symbols-outline.nvim")
  use("voldikss/vim-floaterm")

  use({
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
  })

  -- Colorschemes

  -- LSP
  use("jose-elias-alvarez/null-ls.nvim")

  -- Better coding
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end,
  })

  use({
    "kdheepak/tabline.nvim",
    config = function()
      require("tabline").setup({
        -- Defaults configuration options
        enable = true,
        options = {
          -- If lualine is installed tabline will use separators configured in lualine by default.
          -- These options can be used to override those settings.
          section_separators = { "", "" },
          component_separators = { "", "" },
          max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
          show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
          show_devicons = true, -- this shows devicons in buffer section
          show_bufnr = false, -- this appends [bufnr] to buffer section,
          show_filename_only = false, -- shows base filename only instead of relative path in filename
          modified_icon = "+ ", -- change the default modified icon
          modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
          show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
        },
      })
      vim.cmd([[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]])
    end,
    requires = { { "hoob3rt/lualine.nvim", opt = true }, { "kyazdani42/nvim-web-devicons", opt = true } },
  })
end
