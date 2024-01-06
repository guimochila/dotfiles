return {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeout = 300
    require("which-key").setup({})
  end
}
