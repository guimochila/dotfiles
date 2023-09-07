local group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre",
  {
    pattern = { "*.html", "*.jsx", "*.js", "*.tsx", "*.ts" },
    desc = "Auto-format web dev files with Prettier",
    callback = function()
      vim.cmd("Prettier")
    end,
    group = group
  }
)
