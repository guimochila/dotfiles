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
    'tsx'
  },
  sync_install = false,
  highlight = {
    enable = true,
  },
  indent = { enable = true },
  context_commentstring = { enable = true, enable_autocmd = true },
  incremental_selection = { enable = true },
  autotag = {
    enable = true,
  }
}

return opts
