return {
  "jose-elias-alvarez/null-ls.nvim",
  opts = function()
    local null_ls_status_ok, null_ls = pcall(require, "null-ls")
    if not null_ls_status_ok then
      return
    end

    local b = null_ls.builtins

    local sources = {
      b.formatting.eslint_d,
      b.formatting.prettier.with({
        filetypes = { "html", "css", "json", "yaml" }
      }),
      b.diagnostics.eslint_d,
      b.formatting.stylua,
    }
    return {
      sources = sources,
    }
  end,
  config = function(_, opts)
    require('null-ls').setup(opts)
  end
}
