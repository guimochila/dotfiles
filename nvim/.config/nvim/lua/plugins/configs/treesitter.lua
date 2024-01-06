local opts = {
  ensure_installed = {
    'lua',
    'rust',
    'javascript',
    'typescript',
    'html',
    'markdown',
    'markdown_inline',
    'vim',
    'vimdoc',
    'graphql',
    'css',
    'scss',
    'tsx',
    'bash',
    'gitignore',
    'json',
    'dockerfile'
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>"
    }
  },
  autotag = {
    enable = true,
  }
}

return opts
