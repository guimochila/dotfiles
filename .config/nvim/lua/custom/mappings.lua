local M = {}

M.disabled = {
  n = {
    ["<C-h>"] = "",
    ["<C-j>"] = "",
    ["<C-k>"] = "",
    ["<C-l>"] = ""
  }
}

M.abc = {
  n = {
      ["<C-h>"] = { ":NavigatorLeft <CR>", "Tmux navigate Left" },
      ["<C-j>"] = { ":NavigatorDown <CR>", "Tmux navigate Down" },
      ["<C-k>"] = { ":NavigatorUp <CR>", "Tmux navigate Up" },
      ["<C-l>"] = { ":NavigatorRight <CR>", "Tmux navigate Right" },
      ["<C-\\>"] = { ":NavigatorLastActive <CR>" , "Tmux navigate Last Active" },
      ["<C-Space>"] = { ":NavigatorNext <CR>", "Tmux navigate Next" }
  }
}

return M
