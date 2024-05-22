return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'astro',
        'lua',
        'rust',
        'javascript',
        'typescript',
        'svelte',
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
        'dockerfile',
        'go',
        'gotmpl',
        'templ'
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
      }
    })

    vim.treesitter.language.register('markdown', 'mdx')
  end
}
