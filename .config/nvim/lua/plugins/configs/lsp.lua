local lsp = require("lsp-zero").preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  "tsserver",
  "eslint",
  "lua_ls",
  -- Rust
  "rust_analyzer",
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' }
      }
    }
  }
})

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 1000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
    ['null-ls'] = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }
  }
})

lsp.skip_server_setup({ 'rust_analyzer' })
lsp.setup()

local rust_tools = require('rust-tools')

rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr, desc = "Hover Action" })
      vim.keymap.set("n", "<Leader>vca", rust_tools.code_action_group.code_action_group,
        { buffer = bufnr, desc = "Code Actions" })
    end
  }
})
