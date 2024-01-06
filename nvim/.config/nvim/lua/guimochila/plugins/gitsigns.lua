return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = true,
  keys = {
    { "<leader>tb", ":Gitsigns blame_line<CR>", desc = "Git line blame" }
  }
}
