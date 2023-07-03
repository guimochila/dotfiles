return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local null_ls_status_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_status_ok then
      return
    end

    local b = null_ls.builtins

    local sources = {
      b.formatting.prettier.with({
        filetypes = { "html", "css", "json", "yaml", "javascript", "javascriptreact", "typescript", "typescriptreact" }
      }),
      b.diagnostics.eslint,
      -- for tailwindcss
      b.formatting.rustywind.with({
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
      }),
      b.formatting.stylua,
    }
    return {
      sources = sources,
    }
  end,
  init = function()
    require('null-ls').setup(opts)
  end
}
