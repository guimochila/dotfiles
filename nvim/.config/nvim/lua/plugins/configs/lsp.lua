local lsp = require("lsp-zero").preset({})

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

-- Configuring ESlint LSP
require('lspconfig').eslint.setup({
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

lsp.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 1000,
  },
  servers = {
    ['lua_ls'] = { 'lua' },
    ['rust_analyzer'] = { 'rust' },
  }
})

lsp.on_attach(function(client, bufnr)
  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, { buffer = buffer, desc = "Go to definition" })
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, { buffer = bufnr, desc = "Hover" })
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
    { buffer = bufnr, desc = "Diagnostics" })
  vim.keymap.set("n", "<Leader>va", function() vim.lsp.buf.code_action() end,
    { buffer = bufnr, desc = "Code Actions" })
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = bufnr, desc = "References" })
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = bufnr, desc = "Rename" })
  lsp.buffer_autoformat()
end)

-- lsp.skip_server_setup({ 'rust_analyzer' })

local rust_tools = require('rust-tools')

rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        { buffer = bufnr, desc = "Diagnostics" })
      vim.keymap.set('n', '<leader>vh', rust_tools.hover_actions.hover_actions, { buffer = bufnr, desc = "Hover Action" })
      vim.keymap.set("n", "<Leader>va", rust_tools.code_action_group.code_action_group,
        { buffer = bufnr, desc = "Code Actions" })
    end
  }
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
