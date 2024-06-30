return {
  "olexsmir/gopher.nvim",
  ft = "go",
  config = function(_, opts)
    require("gopher").setup(opts)
  end,
  build = function()
    vim.cmd [[silent! GoInstallDeps]]
  end,
  keys = {
    { "<leader>gtj", "<cmd> GoTagAdd json <CR>", desc = "Add json struct tags" },
    { "<leader>gty", "<cmd> GoTagAdd yaml <CR>", desc = "Add yaml struct tags" },
    { "<leader>gE",  "<cmd> GoIfErr <CR>",       desc = "Add if error block" }
  }
}
