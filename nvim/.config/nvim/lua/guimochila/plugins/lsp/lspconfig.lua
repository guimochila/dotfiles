local function attach(client, bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.keymap -- for conciseness

  opts.desc = "Go to definiton"
  keymap.set("n", "gd", vim.lsp.buf.definition, opts)

  opts.desc = "Hover"
  keymap.set("n", "K", vim.lsp.buf.hover, opts)

  opts.desc = "Show Diagnostics error message"
  keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

  opts.desc = "Go to previous Diagnostics"
  keymap.set("n", "d<", vim.diagnostic.goto_prev, opts)

  opts.desc = "Go to next Diagnostics"
  keymap.set("n", "d>", vim.diagnostic.goto_next, opts)

  opts.desc = "Open diagnostic quickfix"
  keymap.set("n", "dq", vim.diagnostic.setloclist, opts)

  opts.desc = "Code Actions"
  keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)

  opts.desc = "References"
  keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)

  opts.desc = "Rename variable"
  keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })

  -- Format on save via LSP
  vim.cmd([[autocmd BufWritePre * lua vim.cmd(':Format')]])
end

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "lvimuser/lsp-inlayhints.nvim",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    opts = {
      inlay_hints = { enabled = true },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            if server_name ~= "rust_analyzer" then
              lspconfig[server_name].setup {
                on_attach = attach,
                capabilities = capabilities
              }
            end
          end,
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup {
              on_attach = attach,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" }
                  }
                }
              }
            }
          end,
          -- Configuring Go LSP
          ['gopls'] = function()
            lspconfig.gopls.setup {
              on_attach = attach,
              capabilities = capabilities,
              cmd = { "gopls" },
              settings = {
                gopls = {
                  completeUnimported = true,
                  usePlaceholders = true,
                  analyses = {
                    unusedparams = true,
                  }
                }
              }
            }
          end,
          -- Configuring Emmet for other file types
          ['emmet_ls'] = function()
            lspconfig.emmet_ls.setup {
              on_attach = attach,
              capabilities = capabilities,
              filetypes = { "html", "templ", "tpml" }
            }
          end
        }
      })
    end
  },
}
