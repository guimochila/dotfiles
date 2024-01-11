return {
  'mrcjkb/rustaceanvim',
  version = '^3', -- Recommended
  ft = { 'rust' },
  dependencies = {
    {"simrat39/inlay-hints.nvim",
    config = function ()
      require("inlay-hints").setup()
    end
  }
  },
  config = function()
    vim.g.rustaceanvim = {
      tools = {
        on_initialized = function()
          vim.cmd([[
              augroup RustLSP
                autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
                autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
              augroup END
            ]])

          require("inlay-hints").set_all()
        end,
      },
    -- LSP configuration
    server = {
        on_attach = function(client, bufnr)
          require("inlay-hints").on_attach(client, bufnr)

          local opts = { noremap = true, silent = true }
          local keymap = vim.keymap

          opts.desc = "Go to definiton"
          keymap.set("n", "gD", vim.lsp.buf.definition, opts)

          opts.desc = "Hover"
          keymap.set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Diagnostics"
          keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)

          opts.desc = "Code Actions"
          keymap.set("n", "<Leader>ca", vim.lsp.buf.code_action, opts)

          opts.desc = "References"
          keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)

          opts.desc = "Rename variable"
          keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        end,
        settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },
            -- Add clippy lints for Rust.
            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      }
    }
  end
}
