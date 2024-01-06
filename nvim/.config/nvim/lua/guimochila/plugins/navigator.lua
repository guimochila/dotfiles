return {
  "numToStr/Navigator.nvim",
  lazy = false,
  config = function()
    require('Navigator').setup()
  end,
  keys = {
    { "<C-h>",  ":NavigatorLeft <CR>",       desc = "Tmux navigate Left" },
    { "<C-j>",  ":NavigatorDown <CR>",       desc = "Tmux navigate Down" },
    { "<C-k>",  ":NavigatorUp <CR>",         desc = "Tmux navigate Up" },
    { "<C-l>",  ":NavigatorRight <CR>",      desc = "Tmux navigate Right" },
    { "<C-\\>", ":NavigatorLastActive <CR>", desc = "Tmux navigate Last Active" },
  }
}
