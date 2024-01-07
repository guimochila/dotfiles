local function attach()
  local opts = { noremap = true, silent = true }
  local keymap = vim.keymap -- for conciseness

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

  opts.desc = "Restart LSP"
  keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
end

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")



      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()


      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            lspconfig[server_name].setup {
              on_attach = attach,
              capabilities = capabilities
            }
          end
        }
      })
    end
  },
}
