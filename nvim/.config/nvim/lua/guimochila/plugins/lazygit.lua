return {
  "kdheepak/lazygit.nvim",
  -- optional for floating window border decoration
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<leader>lz", ":LazyGit<cr>", desc = "Lazygit plugin" }
  }
}
