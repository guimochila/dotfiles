local keymap = vim.keymap

-- Remapping key
vim.g.mapleader = " "
keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")
keymap.set("x", "<leader>P", [["_dP]])
keymap.set("n", "<leader>y", [["+Y]])
-- Do not yank on x
keymap.set('n', 'x', '"_x')

-- Increment/Decrement
keymap.set('n', '-', '<C-x>')
keymap.set('n', '+', '<C-a>')

-- Source init file
keymap.set('n', '<leader><CR>', ':so ~/.config/nvim/init.lua<CR>')

-- Quicklist
-- I know, right? Bizarre mapping using Alt on MacOS
keymap.set('n', 'œ', ':copen<CR>')
keymap.set('n', '∆', ':cnext<CR>')
keymap.set('n', '˚', ':cprev<CR>')

-- Closing buffers
keymap.set('n', '<leader>cx', ':bd<CR>', { desc = "Close current buffer" })
keymap.set('n', '<leader>cX', ':bd!<CR>', { desc = "Close current buffer without saving" })

-- Tmux Sessionizer
keymap.set("n", "<C-T>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Highlight when yaking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight yanking text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})

keymap.set('n', '<leader>co', function()
  if vim.g.copilot_enabled == 0 then
    local current_folder = vim.fn.getcwd()
    if string.find(current_folder, "/work") then
      vim.cmd("Copilot enable")
      print("Copilot enabled! \u{1F680}")
    else
      print("This is not a working project! \u{270B}")
    end
  else
    vim.cmd("Copilot disable")
    print("Copilot disabled! \u{1F44D}")
  end
end, { desc = "Enable/Disable Copilot" })
