local group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true })
local formatWith = { Prettier = "Prettier", Eslint = "EslintFixAll" }

vim.api.nvim_create_autocmd("BufWritePre",
  {
    pattern = { "*.html", "*.jsx", "*.js", "*.tsx", "*.ts" },
    desc = "Auto-format web dev files with Prettier",
    callback = function()
      if vim.g.formatOnsaveWith then
        vim.cmd("Prettier")
      end
    end,
    group = group
  }
)

function setFormatter(formatter)
  print(formatter.args)
  vim.g.formatOnsaveWith = "Prettier"
end

vim.api.nvim_create_user_command('FormatWith', setFormatter, { nargs = '?' })
