return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    delay = 300,
    triggers = {
      { "<auto>", mode = "nisoc" },
    }
  }
}
