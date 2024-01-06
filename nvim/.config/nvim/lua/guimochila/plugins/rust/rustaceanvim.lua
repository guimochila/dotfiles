return {
  'mrcjkb/rustaceanvim',
  version = '^3', -- Recommended
  ft = { 'rust' },
  dependencies = {
    "lvimuser/lsp-inlayhints.nvim"
  },
  config = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      inlay_hints = {
        highlight = "NonText",
      },
      tools = {
        hover_actions = {
          auto_focus = true,
        },
      },
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          require("lsp-inlayhints").on_attach(client, bufnr)
          require("lsp-inlayhints").show()
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
      },
    }
  end
}
